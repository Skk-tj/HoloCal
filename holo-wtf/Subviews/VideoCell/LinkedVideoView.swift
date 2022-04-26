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
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: "abcd", title: "my debut live member only", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        LinkedVideoView(videoKey: "testVideoId") {
            LiveCellView(live: previewLive, twitterLink: "abcd")
        }
    }
}
