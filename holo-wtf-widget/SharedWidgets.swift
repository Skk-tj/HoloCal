//
//  SharedWidgets.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

/// These widgets are shared between iOS Lock Screen widgets and watchOS complications
struct LiveAccessoryRectangularWidget: Widget {
    let kind: String = "LiveAccessoryRectangularWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VideoWidgetProvider(url: hololiveLiveURL, sortStrategy: liveSortStrategy)) { entry in
            LiveAccessoryRectangularWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
        .supportedFamilies([.accessoryRectangular])
    }
}

struct UpcomingAccessoryRectangularWidget: Widget {
    let kind: String = "UpcomingAccessoryRectangularWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VideoWidgetProvider(url: hololiveWidgetUpcomingURL, sortStrategy: upcomingSortStrategy)) { entry in
            UpcomingAccessoryRectangularWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_WIDGET_DESCRIPTION")
        .supportedFamilies([.accessoryRectangular])
    }
}
