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
            VideoWidgetEntryView(entry: entry, videoType: .live)
        }
        .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
#if os(watchOS)
        .supportedFamilies([.accessoryRectangular, .accessoryCorner, .accessoryInline])
#else
        .supportedFamilies([.systemSmall, .systemLarge, .accessoryRectangular, .accessoryCircular, .accessoryInline])
#endif
    }
}

struct SingleUpcomingWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.upcoming-single"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: UpcomingWidgetIntent.self, provider: VideoUpcomingWidgetProvider()) { entry in
            VideoWidgetEntryView(entry: entry, videoType: .upcoming)
        }
        .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_WIDGET_DESCRIPTION")
#if os(watchOS)
        .supportedFamilies([.accessoryRectangular, .accessoryCorner, .accessoryInline])
#else
        .supportedFamilies([.systemSmall, .systemLarge, .accessoryRectangular, .accessoryCircular, .accessoryInline])
#endif
    }
}

struct SinglePastWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.past-single"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: PastWidgetIntent.self, provider: VideoPastWidgetProvider()) { entry in
            VideoWidgetEntryView(entry: entry, videoType: .past)
        }
        .configurationDisplayName("PAST_WIDGET_DISPLAY_NAME")
        .description("PAST_WIDGET_DESCRIPTION")
#if os(watchOS)
        .supportedFamilies([.accessoryRectangular, .accessoryCorner, .accessoryInline])
#else
        .supportedFamilies([.systemSmall, .systemLarge, .accessoryRectangular, .accessoryCircular, .accessoryInline])
#endif
    }
}

struct LiveCountWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.live-count"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: CountLiveWidgetProvider()) { entry in
            AccessoryWatchCircularEntryViews(entry: entry, videoType: .live)
        }
        .configurationDisplayName("LIVE_COUNT_WIDGET_DISPLAY_NAME")
        .description("LIVE_COUNT_WIDGET_DESCRIPTION")
        .supportedFamilies([.accessoryCircular])
    }
}
