//
//  VideoContextMenu.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoContextMenu: View {
    let video: LiveVideo
    
    var body: some View {
        // MARK: - Twitter Button
        if let twitterLink = video.channel.twitter {
            let url = "https://twitter.com/\(twitterLink)"
            
            if let finalURL = URL(string: url) {
                Link(destination: finalURL) {
                    Label("VIDEO_CONTEXT_MENU_TWITTER_PROFILE", systemImage: "bubble.left")
                }
            }
        }
        
        // MARK: - YouTube Button
        if let finalURL = video.channel.channelURL {
            Link(destination: finalURL) {
                Label("VIDEO_CONTEXT_MENU_YOUTUBE_CHANNEL", systemImage: "play.rectangle")
            }
        }
        
        // MARK: - Favourite Button
        FavouriteButton(video: video) { isFavourited in
            Label(isFavourited ? "VIDEO_CONTEXT_MENU_REMOVE_FAVOURITE" : "VIDEO_CONTEXT_MENU_FAVOURITE_CHANNEL", systemImage: isFavourited ? "star.slash" : "star")
        }
        
        // MARK: - Share button
        ShareLink(item: URL(string: "https://www.youtube.com/watch?v=\(video.id)")!, label: { Label("VIDEO_CONTEXT_MENU_SHARE", systemImage: "square.and.arrow.up")
        })
    }
}

struct VideoContextMenu_Previews: PreviewProvider {    
    static var previews: some View {
        VideoContextMenu(video: LiveVideo.previewLive)
    }
}
