//
//  SharedEntryView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

@available(iOSApplicationExtension 16.0, *)
struct LiveAccessoryRectangularWidgetEntryView: View {
    var entry: LiveWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            LiveAccessoryRectangularWidgetView(live: video)
        } else {
            VStack(alignment: .leading) {
                Label("LIVE_WIDGET_TITLE_NON_BOLD", systemImage: "person.wave.2.fill")
                    .font(.headline)
                    .widgetAccentable()
                
                Text("NO_ONE_IS_STREAMING")
            }
        }
    }
}

@available(iOSApplicationExtension 16.0, *)
struct UpcomingAccessoryRectangularWidgetEntryView: View {
    var entry: UpcomingWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            UpcomingAccessoryRectangularWidgetView(upcoming: video)
        } else {
            VStack(alignment: .leading) {
                Label("UPCOMING_WIDGET_TITLE_NON_BOLD", systemImage: "clock")
                    .font(.headline)
                    .widgetAccentable()
                
                Text("NO_ONE_IS_STREAMING")
            }
        }
    }
}
