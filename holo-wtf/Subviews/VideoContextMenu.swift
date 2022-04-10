//
//  VideoContextMenu.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-25.
//

import SwiftUI

struct VideoContextMenu: View {
    let video: LiveVideo
    
    var body: some View {
        if let twitterLink = video.channel.twitterLink {
            let url = "https://twitter.com/\(twitterLink)"
            
            if let finalURL = URL(string: url) {
                Link(destination: finalURL) {
                    Text("VIDEO_CONTEXT_MENU_TWITTER_PROFILE")
                }
            }
        }
        
        if let ytChannelId = video.channel.ytChannelId {
            let url = "https://www.youtube.com/channel/\(ytChannelId)"
            
            if let finalURL = URL(string: url) {
                Link(destination: finalURL) {
                    Text("VIDEO_CONTEXT_MENU_YOUTUBE_CHANNEL")
                }
            }
        }
    }
}

struct VideoContextMenu_Previews: PreviewProvider {
    static let testChannel = Channel(id: 0, ytChannelId: "testChannelId", name: "a certain tuber's channel name", description: "hihihi", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), publishedAt: Date(timeIntervalSinceNow: -1000), twitterLink: "a_certain_vtuber")
    
    static let previewLive = LiveVideo(id: 0, ytVideoKey: "testVideoId", title: "my debut live", thumbnail: nil, liveSchedule: nil, liveStart: nil, liveEnd: nil, liveViewers: 100, channel: testChannel)
    
    static var previews: some View {
        VideoContextMenu(video: previewLive)
    }
}
