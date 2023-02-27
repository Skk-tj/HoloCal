//
//  PaneEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct LivePaneWidgetEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: { video in
            LiveWidgetView(live: video, thumbnailData: entry.thumbnailData, avatarData: entry.avatarData)
        }, titleView: {
            LiveTitleView()
        })
        .frame(width: .infinity)
    }
}

struct UpcomingPaneWidgetEntryView: View {
    var entry: VideoUpcomingWidgetProvider.Entry
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: { video in
            UpcomingWidgetView(upcoming: video, thumbnailData: entry.thumbnailData, avatarData: entry.avatarData)
        }, titleView: {
            UpcomingTitleView()
        })
        .frame(width: .infinity)
    }
}

struct PastPaneWidgetEntryView: View {
    var entry: VideoPastWidgetProvider.Entry
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: { video in
            PastWidgetView(past: video, thumbnailData: entry.thumbnailData, avatarData: entry.avatarData)
        }, titleView: {
            PastTitleView()
        })
        .frame(width: .infinity)
    }
}
