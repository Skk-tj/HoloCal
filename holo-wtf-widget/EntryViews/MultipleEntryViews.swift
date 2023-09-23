//
//  MultipleEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct BaseMultipleViewEntryView<MainContent: View, SubContent: View, TitleContent: View>: View {
    let entry: MultipleVideoWidgetEntry
    
    @ViewBuilder let twoVideosView: (_ videoLeft: LiveVideo, _ videoRight: LiveVideo) -> MainContent
    @ViewBuilder let singleVideoView: (_ video: LiveVideo) -> SubContent
    @ViewBuilder let titleView: () -> TitleContent
    
    var body: some View {
        VStack {
            titleView()
            
            switch entry.status {
            case .ok:
                switch entry.videos.count {
                case 0:
                    NoStreamView()
                case 1:
                    if let first = entry.videos.first {
                        singleVideoView(first)
                    } else {
                        NetworkErrorView()
                    }
                case 2:
                    if let first = entry.videos.first, let second = entry.videos.last {
                        twoVideosView(first, second)
                    } else {
                        NetworkErrorView()
                    }
                default:
                    NetworkErrorView()
                }
            case .noVideo:
                NoStreamView()
            case .network:
                NetworkErrorView()
            }
        }
        .padding()
    }
}

struct AppIntentBaseMultipleViewEntryView<MainContent: View, SubContent: View, TitleContent: View>: View {
    let entry: AppIntentMultipleVideoWidgetEntry
    
    @ViewBuilder let twoVideosView: (_ videoLeft: LiveVideo, _ videoRight: LiveVideo) -> MainContent
    @ViewBuilder let singleVideoView: (_ video: LiveVideo) -> SubContent
    @ViewBuilder let titleView: () -> TitleContent
    
    var body: some View {
        VStack {
            titleView()
            
            switch entry.status {
            case .ok:
                switch entry.videos.count {
                case 0:
                    NoStreamView()
                case 1:
                    if let first = entry.videos.first {
                        singleVideoView(first)
                    } else {
                        NetworkErrorView()
                    }
                case 2:
                    if let first = entry.videos.first, let second = entry.videos.last {
                        twoVideosView(first, second)
                    } else {
                        NetworkErrorView()
                    }
                default:
                    NetworkErrorView()
                }
            case .noVideo:
                NoStreamView()
            case .network:
                NetworkErrorView()
            }
        }
    }
}

struct MultipleWidgetEntryView: View {
    let entry: MultipleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        BaseMultipleViewEntryView(entry: entry, twoVideosView: { v1, v2 in
            MultipleWidgetView(leftVideo: v1, leftVideoThumbnail: entry.images.first ?? Data(), rightVideo: v2, rightVideoThumbnail: entry.images.last ?? Data(), videoType: videoType)
        }, singleVideoView: { video in
            WidgetMediumView(video: video, videoThumbnail: entry.images.first ?? Data(), videoType: videoType)
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

struct AppIntentMultipleWidgetEntryView: View {
    let entry: AppIntentMultipleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        AppIntentBaseMultipleViewEntryView(entry: entry, twoVideosView: { v1, v2 in
            MultipleWidgetView(leftVideo: v1, leftVideoThumbnail: entry.images.first ?? Data(), rightVideo: v2, rightVideoThumbnail: entry.images.last ?? Data(), videoType: videoType)
        }, singleVideoView: { video in
            WidgetMediumView(video: video, videoThumbnail: entry.images.first ?? Data(), videoType: videoType)
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
