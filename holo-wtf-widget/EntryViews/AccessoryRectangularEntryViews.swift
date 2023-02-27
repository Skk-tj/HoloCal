//
//  AccessoryRectangularEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct VideoAccessoryRectangularWidgetEntryView<MainContent: View, ErrorContent: View>: View {
    var entry: SingleVideoWidgetEntry
    
    @ViewBuilder let mainView: (_ video: LiveVideo) -> MainContent
    @ViewBuilder let errorTitle: () -> ErrorContent
    
    var body: some View {
        if let video = entry.video {
            mainView(video)
        } else {
            VStack(alignment: .leading) {
                errorTitle()
                
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct AccessoryRectangularEntryView: View {
    var entry: SingleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        VideoAccessoryRectangularWidgetEntryView(entry: entry, mainView: { video in
            AccessoryRectangularWidgetView(video: video, videoType: videoType)
        }, errorTitle: {
            switch videoType {
            case .live:
                Label("LIVE_WIDGET_TITLE_NON_BOLD", systemImage: "person.wave.2.fill")
                    .font(.headline)
                    .widgetAccentable()
            case .upcoming:
                Label("UPCOMING_WIDGET_TITLE_NON_BOLD", systemImage: "clock")
                    .font(.headline)
                    .widgetAccentable()
            case .past:
                Label("PAST_WIDGET_TITLE_NON_BOLD", systemImage: "clock.arrow.circlepath")
                    .font(.headline)
                    .widgetAccentable()
            }
        })
    }
}
