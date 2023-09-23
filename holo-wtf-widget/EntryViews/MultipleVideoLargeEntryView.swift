//
//  MultipleVideoLargeEntryView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI

struct BaseMultipleVideoLargeEntryView<MainContent: View, TitleContent: View>: View {
    let entry: MultipleVideoWidgetEntry
    
    @ViewBuilder let mainView: (_ videos: [LiveVideo]) -> MainContent
    @ViewBuilder let titleView: () -> TitleContent
    
    var body: some View {
        VStack {
            titleView()
            
            switch entry.status {
            case .ok:
                mainView(entry.videos)
                Spacer()
            case .noVideo:
                Spacer()
                NoStreamView()
                Spacer()
            case .network:
                Spacer()
                NetworkErrorView()
                Spacer()
            }
        }
        .padding()
    }
}

struct AppIntentBaseMultipleVideoLargeEntryView<MainContent: View, TitleContent: View>: View {
    let entry: AppIntentMultipleVideoWidgetEntry
    
    @ViewBuilder let mainView: (_ videos: [LiveVideo]) -> MainContent
    @ViewBuilder let titleView: () -> TitleContent
    
    var body: some View {
        VStack {
            titleView()
            
            switch entry.status {
            case .ok:
                mainView(entry.videos)
                Spacer()
            case .noVideo:
                Spacer()
                NoStreamView()
                Spacer()
            case .network:
                Spacer()
                NetworkErrorView()
                Spacer()
            }
        }
    }
}

struct MultipleVideoLargeEntryView: View {
    let entry: MultipleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        BaseMultipleVideoLargeEntryView(entry: entry, mainView: { videos in
            MultipleVideoLargeWidgetView(videos: videos, avatars: entry.images, videoType: videoType)
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

struct AppIntentMultipleVideoLargeEntryView: View {
    let entry: AppIntentMultipleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        AppIntentBaseMultipleVideoLargeEntryView(entry: entry, mainView: { videos in
            MultipleVideoLargeWidgetView(videos: videos, avatars: entry.images, videoType: videoType)
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
