//
//  SharedWidgets.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-18.
//

import SwiftUI
import WidgetKit

/// These widgets are shared between iOS Lock Screen widgets and watchOS complications
struct LiveAccessoryRectangularWidget: Widget {
    let kind: String = "LiveAccessoryRectangularWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: VideoLiveWidgetProvider()) { entry in
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
        IntentConfiguration(kind: kind, intent: UpcomingWidgetIntent.self, provider: VideoUpcomingWidgetProvider()) { entry in
            UpcomingAccessoryRectangularWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_WIDGET_DESCRIPTION")
        .supportedFamilies([.accessoryRectangular])
    }
}
