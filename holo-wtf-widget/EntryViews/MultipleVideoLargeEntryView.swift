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
            
            Spacer()
            
            switch entry.status {
            case .ok:
                mainView(entry.videos)
            case .noVideo:
                NoStreamView()
            case .network:
                NetworkErrorView()
            }
            
            Spacer()
        }
        .padding()
    }
}

struct MultipleVideoLargeEntryView: View {
    let entry: MultipleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        BaseMultipleVideoLargeEntryView(entry: entry, mainView: { videos in
            MultipleVideoLargeWidgetView(videos: Array(videos.prefix(4)), avatars: [Data()], videoType: videoType)
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
