//
//  VideoContextMenu.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-25.
//

import SwiftUI

struct VideoContextMenu: View {
    let video: LiveVideo
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
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
        FavouriteButton(video: video) {
            let isFavourited = favourited.contains(where: {$0 == video.channel.id})
            Label(isFavourited ? "VIDEO_CONTEXT_MENU_REMOVE_FAVOURITE" : "VIDEO_CONTEXT_MENU_FAVOURITE_CHANNEL", systemImage: isFavourited ? "star.slash" : "star")
        }
        
        // MARK: - Share button
        if #available(iOS 16.0, *) {
            ShareLink(item: URL(string: "https://www.youtube.com/watch?v=\(video.id)")!, label: { Label("VIDEO_CONTEXT_MENU_SHARE", systemImage: "square.and.arrow.up")
            })
        } else {
            OldShareButton(video: video) {
                Label("VIDEO_CONTEXT_MENU_SHARE", systemImage: "square.and.arrow.up")
            }
        }
    }
}

struct VideoContextMenu_Previews: PreviewProvider {    
    static var previews: some View {
        VideoContextMenu(video: LiveVideo.previewLive)
    }
}
