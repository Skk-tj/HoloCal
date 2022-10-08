//
//  SharedWidgets.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct LiveAccessoryRectangularWidget: Widget {
    let kind: String = "LiveAccessoryRectangularWidget"
    
    var body: some WidgetConfiguration {
        if #available(iOSApplicationExtension 16.0, *) {
            return StaticConfiguration(kind: kind, provider: VideoWidgetProvider(url: hololiveLiveURL, sortStrategy: liveSortStrategy)) { entry in
                LiveAccessoryRectangularWidgetEntryView(entry: entry)
            }
            .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
            .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
            .supportedFamilies([.accessoryRectangular])
        } else {
            return EmptyWidgetConfiguration()
        }
    }
}

struct UpcomingAccessoryRectangularWidget: Widget {
    let kind: String = "UpcomingAccessoryRectangularWidget"
    
    var body: some WidgetConfiguration {
        if #available(iOSApplicationExtension 16.0, *) {
            return StaticConfiguration(kind: kind, provider: VideoWidgetProvider(url: hololiveWidgetUpcomingURL, sortStrategy: upcomingSortStrategy)) { entry in
                UpcomingAccessoryRectangularWidgetEntryView(entry: entry)
            }
            .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
            .description("UPCOMING_WIDGET_DESCRIPTION")
            .supportedFamilies([.accessoryRectangular])
        } else {
            return EmptyWidgetConfiguration()
        }
    }
}
