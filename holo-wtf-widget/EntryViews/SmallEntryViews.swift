//
//  SmallEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct SmallWidgetEntryView: View {
    var entry: SingleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: { video in
            SmallWidgetView(video: video, avatarData: entry.avatarData, videoType: videoType)
        }, titleView: {
            switch videoType {
            case .live:
                LiveTitleView()
            case .upcoming:
                UpcomingTitleView()
            case .past:
                PastTitleView()
            }
        })
    }
}