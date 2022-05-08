//
//  ShareButton.swift
//  holo-wtf
//
//
//

import SwiftUI
import ActivityView

struct ShareButton<Content: View>: View {
    let video: LiveVideo
    @ViewBuilder let content: () -> Content
    
    @State private var item: ActivityItem?
    
    var body: some View {
        Button(action: {
            let url = URL(string: "https://www.youtube.com/watch?v=\(video.id)")
            self.item = ActivityItem(items: url!)
        }) {
            content()
        }
        .activitySheet($item)
    }
}

struct ShareButton_Previews: PreviewProvider {
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        ShareButton(video: previewLive) {
            Label("VIDEO_CONTEXT_MENU_SHARE", systemImage: "square.and.arrow.up")
        }
    }
}
