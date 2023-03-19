//
//  MultipleEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct BaseMultipleViewEntryView<MainContent: View, SubContent: View, TitleContent: View>: View {
    var entry: MultipleVideoWidgetEntry
    
    @ViewBuilder let twoVideosView: (_ videoLeft: LiveVideo, _ videoRight: LiveVideo) -> MainContent
    @ViewBuilder let singleVideoView: (_ video: LiveVideo) -> SubContent
    @ViewBuilder let titleView: () -> TitleContent
    
    var body: some View {
        VStack {
            titleView()
            
            switch entry.status {
            case .ok:
                if let videoLeft = entry.videoLeft, let videoRight = entry.videoRight {
                    twoVideosView(videoLeft, videoRight)
                }
                
                if entry.videoRight == nil {
                    if let videoLeft = entry.videoLeft {
                        singleVideoView(videoLeft)
                    } else {
                        NoStreamView()
                    }
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

struct MultipleWidgetEntryView: View {
    var entry: MultipleVideoWidgetEntry
    var videoType: VideoType
    
    var body: some View {
        BaseMultipleViewEntryView(entry: entry, twoVideosView: { v1, v2 in
            MultipleWidgetView(leftVideo: v1, leftVideoThumbnail: entry.thumbnailDataLeft, rightVideo: v2, rightVideoThumbnail: entry.thumbnailDataRight, videoType: videoType)
        }, singleVideoView: { video in
            WidgetMediumView(video: video, videoThumbnail: entry.thumbnailDataLeft, videoType: videoType)
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
