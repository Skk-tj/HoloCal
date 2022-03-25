//
//  LinkedVideoView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LinkedVideoView<Content: View>: View {
    var videoKey: String?
    var content: () -> Content
    
    init(videoKey: String?, @ViewBuilder content: @escaping () -> Content) {
        self.videoKey = videoKey
        self.content = content
    }
    
    var body: some View {
        if let key = videoKey {
            let url = "https://www.youtube.com/watch?v=\(key)"
            
            if let finalURL = URL(string: url) {
                Link(destination: finalURL) {
                    content()
                }
            } else {
                content()
            }
        } else {
            content()
        }
    }
}

struct LinkedVideoView_Previews: PreviewProvider {
    static let testChannel = Channel(id: 0, ytChannelId: "testChannelId", name: "a certain tuber's channel name", description: "hihihi", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), publishedAt: Date(timeIntervalSinceNow: -1000), twitterLink: "a_certain_vtuber")
    
    static let previewLive = LiveVideo(id: 0, ytVideoKey: "testVideoId", title: "my debut live", thumbnail: nil, liveSchedule: nil, liveStart: nil, liveEnd: nil, liveViewers: 100, channel: testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: 0, ytVideoKey: "testVideoId", title: "my debut live member only", thumbnail: nil, liveSchedule: nil, liveStart: nil, liveEnd: nil, liveViewers: 100, channel: testChannel)
    
    static var previews: some View {
        LinkedVideoView(videoKey: "testVideoId") {
            LiveCellView(live: previewLive, isShowingAbsoluteTime: Binding.constant(true))
            LiveCellView(live: previewLiveMemberOnly, isShowingAbsoluteTime: Binding.constant(false))
        }
    }
}
