//
//  SwipableLinkedCellView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-10.
//

import SwiftUI

struct SwipableLinkedCellView<Content: View>: View {
    let video: LiveVideo
    let content: () -> Content
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    init(video: LiveVideo, @ViewBuilder content: @escaping () -> Content) {
        self.video = video
        self.content = content
    }
    
    var body: some View {
        LinkedVideoView(videoKey: video.ytVideoKey) {
            content()
        }
        .swipeActions {
            let isFavourited = favourited.contains(where: {$0 == video.channel.id})
            
            Button(action: {
                withAnimation {
                    if !isFavourited {
                        favourited.append(video.channel.id)
                    } else {
                        favourited.removeAll(where: {$0 == video.channel.id})
                    }
                }
            }) {
                Label(isFavourited ? "LINKED_VIDEO_SWIPE_ACTIONS_UNFAVOURITE" : "LINKED_VIDEO_SWIPE_ACTIONS_FAVOURITE", systemImage: isFavourited ? "star.slash" : "star")
            }
            .tint(.yellow)
            
            Button(action: {
                shareSheet(url: "https://www.youtube.com/watch?v=\(video.ytVideoKey!)")
            }, label: {
                Label("Share", systemImage: "square.and.arrow.up")
            })
            .tint(.blue)
        }
    }
    
    func shareSheet(url: String) {
        let url = URL(string: url)
        let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        let allScenes = UIApplication.shared.connectedScenes
        let scene = allScenes.first { $0.activationState == .foregroundActive }
        
        if let windowScene = scene as? UIWindowScene {
            windowScene.keyWindow?.rootViewController?.present(activityView, animated: true, completion: nil)
        }
    }
}

struct SwipableLinkedCellView_Previews: PreviewProvider {
    static let testChannel = Channel(id: 0, ytChannelId: "testChannelId", name: "a certain tuber's channel name", description: "hihihi", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), publishedAt: Date(timeIntervalSinceNow: -1000), twitterLink: "a_certain_vtuber")
    
    static let previewLive = LiveVideo(id: 0, ytVideoKey: "testVideoId", title: "my debut live", thumbnail: nil, liveSchedule: nil, liveStart: nil, liveEnd: nil, liveViewers: 100, channel: testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: 0, ytVideoKey: "testVideoId", title: "my debut live member only", thumbnail: nil, liveSchedule: nil, liveStart: nil, liveEnd: nil, liveViewers: 100, channel: testChannel)
        
    static var previews: some View {
        SwipableLinkedCellView(video: previewLive) {
            LiveCellView(live: previewLive)
        }
    }
}
