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

struct LiveAccessoryRectangularWidgetEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        VideoAccessoryRectangularWidgetEntryView(entry: entry, mainView: { video in
            LiveAccessoryRectangularWidgetView(live: video)
        }, errorTitle: {
            Label("LIVE_WIDGET_TITLE_NON_BOLD", systemImage: "person.wave.2.fill")
                .font(.headline)
                .widgetAccentable()
        })
    }
}

struct UpcomingAccessoryRectangularWidgetEntryView: View {
    var entry: VideoUpcomingWidgetProvider.Entry
    
    var body: some View {
        VideoAccessoryRectangularWidgetEntryView(entry: entry, mainView: { video in
            UpcomingAccessoryRectangularWidgetView(upcoming: video)
        }, errorTitle: {
            Label("UPCOMING_WIDGET_TITLE_NON_BOLD", systemImage: "clock")
                .font(.headline)
                .widgetAccentable()
        })
    }
}

struct PastAccessoryRectangularWidgetEntryView: View {
    var entry: VideoPastWidgetProvider.Entry
    
    var body: some View {
        VideoAccessoryRectangularWidgetEntryView(entry: entry, mainView: { video in
            PastAccessoryRectangularWidgetView(past: video)
        }, errorTitle: {
            Label("PAST_WIDGET_TITLE_NON_BOLD", systemImage: "clock.arrow.circlepath")
                .font(.headline)
                .widgetAccentable()
        })
    }
}
