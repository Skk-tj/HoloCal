//
//  OldShareButton.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-22.
//

import SwiftUI

struct OldShareButton<Content: View>: View {
    let video: LiveVideo
    let content: () -> Content
    
    init(video: LiveVideo, @ViewBuilder content: @escaping () -> Content) {
        self.video = video
        self.content = content
    }
    
    var body: some View {
        Button(action: {
            shareSheet(url: "https://www.youtube.com/watch?v=\(video.id)")
        }) {
            content()
        }
    }
}

struct OldShareButton_Previews: PreviewProvider {
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        OldShareButton(video: previewLive) {
            Label("VIDEO_CONTEXT_MENU_SHARE", systemImage: "square.and.arrow.up")
        }
    }
}
