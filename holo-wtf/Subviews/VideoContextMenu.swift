//
//  VideoContextMenu.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoContextMenu: View {
    let video: LiveVideo
    let twitterLink: String?
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        // MARK: - Twitter Button
        if let twitterLink = twitterLink {
            let url = "https://twitter.com/\(twitterLink)"
            
            if let finalURL = URL(string: url) {
                Link(destination: finalURL) {
                    Label("VIDEO_CONTEXT_MENU_TWITTER_PROFILE", systemImage: "bubble.left")
                }
            }
        }
        
        // MARK: - YouTube Button
        let url = "https://www.youtube.com/channel/\(video.channel.id)"
        if let finalURL = URL(string: url) {
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
        OldShareButton(video: video) {
            Label("VIDEO_CONTEXT_MENU_SHARE", systemImage: "square.and.arrow.up")
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
