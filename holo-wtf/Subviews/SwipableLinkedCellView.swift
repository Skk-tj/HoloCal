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
        LinkedVideoView(videoKey: video.id) {
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
                shareSheet(url: "https://www.youtube.com/watch?v=\(video.id)")
            }, label: {
                Label("LINKED_VIDEO_SWIPE_ACTIONS_SHARE", systemImage: "square.and.arrow.up")
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
            let rootViewController = (windowScene.windows).first(where: { $0.isKeyWindow })?.rootViewController
            
            // iPad stuff (fine to leave this in for all iOS devices, it will be effectively ignored when not needed)
            activityView.popoverPresentationController?.sourceView = rootViewController?.view
            activityView.popoverPresentationController?.sourceRect = .zero
            
            rootViewController?.present(activityView, animated: true, completion: nil)
        }
    }
}

struct SwipableLinkedCellView_Previews: PreviewProvider {
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        SwipableLinkedCellView(video: previewLive) {
            LiveCellView(live: previewLive)
        }
    }
}
