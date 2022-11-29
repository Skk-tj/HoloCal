//
//  Widgets.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit
import SwiftUI

struct MultipleLiveWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.multiple-live"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: MultipleVideoLiveWidgetProvider()) { entry in
            MultipleLiveWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("MULTIPLE_CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("MULTIPLE_CURRENTLY_LIVE_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}

struct MultipleUpcomingWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.multiple-upcoming"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: UpcomingWidgetIntent.self, provider: MultipleVideoUpcomingWidgetProvider()) { entry in
            MultipleUpcomingWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("MULTIPLE_UPCOMING_WIDGET_DISPLAY_NAME")
        .description("MULTIPLE_UPCOMING_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}

struct LiveChannelsWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.live-channels"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: ChannelsLiveWidgetProvider()) { entry in
            LiveChannelsEntryView(entry: entry)
        }
        .configurationDisplayName("LIVE_CHANNELS_WIDGET_DISPLAY_NAME")
        .description("LIVE_CHANNELS_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}

struct UpcomingChannelsWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.upcoming-channels"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: UpcomingWidgetIntent.self, provider: ChannelsUpcomingWidgetProvider()) { entry in
            UpcomingChannelsEntryView(entry: entry)
        }
        .configurationDisplayName("UPCOMING_CHANNELS_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_CHANNELS_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}
