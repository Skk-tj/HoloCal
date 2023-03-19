//
//  PaneEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct PaneWidgetEntryView: View {
    var entry: SingleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: { video in
            VideoWidgetView(video: video, thumbnailData: entry.thumbnailData, avatarData: entry.avatarData, videoType: videoType)
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
        .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, WidgetDeepLinkAgency.hololive.rawValue)))
    }
}
