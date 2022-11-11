//
//  ShareButton.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-22.
//

import SwiftUI
#if canImport(ActivityView)
import ActivityView
#endif

// FIXME: Remove after iOS 16
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
    static var previews: some View {
        ShareButton(video: LiveVideo.previewLive) {
            Label("VIDEO_CONTEXT_MENU_SHARE", systemImage: "square.and.arrow.up")
        }
    }
}
