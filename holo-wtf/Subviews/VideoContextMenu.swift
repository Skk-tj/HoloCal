//
//  VideoContextMenu.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-25.
//

import SwiftUI

struct VideoContextMenu: View {
    let video: LiveVideo
    let twitterLink: String?
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        if let twitterLink = twitterLink {
            let url = "https://twitter.com/\(twitterLink)"
            
            if let finalURL = URL(string: url) {
                Link(destination: finalURL) {
                    Label("VIDEO_CONTEXT_MENU_TWITTER_PROFILE", systemImage: "bubble.left")
                }
            }
        }
        
        let url = "https://www.youtube.com/channel/\(video.channel.id)"
        
        if let finalURL = URL(string: url) {
            Link(destination: finalURL) {
                Label("VIDEO_CONTEXT_MENU_YOUTUBE_CHANNEL", systemImage: "play.rectangle")
            }
        }
        
        
        let isFavourited = favourited.contains(where: {$0 == video.channel.id})
        
        Button(action: {
            withAnimation {
                if !isFavourited {
                    favourited.append(video.channel.id)
                } else {
                    favourited.removeAll(where: {$0 == video.channel.id})
                }
            }
        }, label: {
            Label(isFavourited ? "VIDEO_CONTEXT_MENU_REMOVE_FAVOURITE" : "VIDEO_CONTEXT_MENU_FAVOURITE_CHANNEL", systemImage: isFavourited ? "star.slash" : "star")
        })
        
        Button(action: {
            shareSheet(url: "https://www.youtube.com/watch?v=\(video.id)")
        }, label: {
            Label("LINKED_VIDEO_SWIPE_ACTIONS_SHARE", systemImage: "square.and.arrow.up")
        })
    }
    
    func shareSheet(url: String) {
        let url = URL(string: url)
        let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        let allScenes = UIApplication.shared.connectedScenes
        let scene = allScenes.first { $0.activationState == .foregroundActive }
        
        if let windowScene = scene as? UIWindowScene {
            let rootViewController = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController
            
            // iPad stuff (fine to leave this in for all iOS devices, it will be effectively ignored when not needed)
            activityView.popoverPresentationController?.sourceView = rootViewController?.view
            activityView.popoverPresentationController?.sourceRect = .zero
            
            rootViewController?.present(activityView, animated: true, completion: nil)
        }
    }
}

struct VideoContextMenu_Previews: PreviewProvider {
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        VideoContextMenu(video: previewLive, twitterLink: "abcd")
    }
}
