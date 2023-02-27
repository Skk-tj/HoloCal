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
            switch videoType {
            case .live:
                SmallLiveWidgetView(live: video, avatarData: entry.avatarData)
            case .upcoming:
                SmallUpcomingWidgetView(upcoming: video, avatarData: entry.avatarData)
            case .past:
                SmallPastWidgetView(past: video, avatarData: entry.avatarData)
            }
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

//struct SmallLiveWidgetEntryView: View {
//    var entry: VideoLiveWidgetProvider.Entry
//
//    var body: some View {
//        BaseVideoEntryView(entry: entry, mainView: { video in
//            SmallLiveWidgetView(live: video, avatarData: entry.avatarData)
//        }, titleView: {
//            LiveTitleView()
//        })
//    }
//}
//
//struct SmallUpcomingWidgetEntryView: View {
//    var entry: VideoUpcomingWidgetProvider.Entry
//
//    var body: some View {
//        BaseVideoEntryView(entry: entry, mainView: { video in
//            SmallUpcomingWidgetView(upcoming: video, avatarData: entry.avatarData)
//        }, titleView: {
//            UpcomingTitleView()
//        })
//    }
//}
//
//struct SmallPastWidgetEntryView: View {
//    var entry: VideoPastWidgetProvider.Entry
//
//    var body: some View {
//        BaseVideoEntryView(entry: entry, mainView: { video in
//            SmallPastWidgetView(past: video, avatarData: entry.avatarData)
//        }, titleView: {
//            PastTitleView()
//        })
//    }
//}
