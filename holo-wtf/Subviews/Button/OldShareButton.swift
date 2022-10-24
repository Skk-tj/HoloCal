//
//  OldShareButton.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-22.
//

import SwiftUI

// FIXME: Remove after iOS 16
struct OldShareButton<Content: View>: View {
    let video: any LiveVideo
    let content: () -> Content
    
    init(video: any LiveVideo, @ViewBuilder content: @escaping () -> Content) {
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
    static var previews: some View {
        OldShareButton(video: HololiveLiveVideo.previewLive) {
            Label("VIDEO_CONTEXT_MENU_SHARE", systemImage: "square.and.arrow.up")
        }
    }
}
