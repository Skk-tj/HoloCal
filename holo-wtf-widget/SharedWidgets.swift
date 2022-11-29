//
//  SharedWidgets.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct SingleLiveWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.live-single"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: VideoLiveWidgetProvider()) { entry in
            VideoLiveWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
#if os(watchOS)
        .supportedFamilies([.accessoryRectangular, .accessoryCorner])
#else
        .supportedFamilies([.systemSmall, .systemLarge, .accessoryRectangular, .accessoryCircular])
#endif
    }
}

struct SingleUpcomingWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.upcoming-single"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: UpcomingWidgetIntent.self, provider: VideoUpcomingWidgetProvider()) { entry in
            VideoUpcomingWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_WIDGET_DESCRIPTION")
#if os(watchOS)
        .supportedFamilies([.accessoryRectangular, .accessoryCorner])
#else
        .supportedFamilies([.systemSmall, .systemLarge, .accessoryRectangular, .accessoryCircular])
#endif
    }
}
