//
//  SharedEntryView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-18.
//

import SwiftUI
import WidgetKit

/// These views are shared between iOS Lock Screen widgets and watchOS complications
struct LiveAccessoryRectangularWidgetEntryView: View {
    var entry: VideoWidgetProvider.Entry
    
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

struct UpcomingAccessoryRectangularWidgetEntryView: View {
    var entry: VideoWidgetProvider.Entry
    
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
