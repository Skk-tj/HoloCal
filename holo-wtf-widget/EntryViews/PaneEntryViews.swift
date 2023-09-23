//
//  PaneEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct PaneWidgetEntryView: View {
    let entry: SingleVideoWidgetEntry
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
        .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency.rawValue)))
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentPaneWidgetEntryView: View {
    let entry: AppIntentSingleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        AppIntentBaseVideoEntryView(entry: entry, mainView: { video in
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
        .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency?.rawValue ?? "")))
    }
}
