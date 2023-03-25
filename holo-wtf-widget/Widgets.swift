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
            AllMultipleVideoEntryView(entry: entry, videoType: .live)
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
            AllMultipleVideoEntryView(entry: entry, videoType: .upcoming)
        }
        .configurationDisplayName("MULTIPLE_UPCOMING_WIDGET_DISPLAY_NAME")
        .description("MULTIPLE_UPCOMING_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}

struct MultiplePastWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.multiple-past"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: PastWidgetIntent.self, provider: MultipleVideoPastWidgetProvider()) { entry in
            AllMultipleVideoEntryView(entry: entry, videoType: .past)
        }
        .configurationDisplayName("MULTIPLE_PAST_WIDGET_DISPLAY_NAME")
        .description("MULTIPLE_PAST_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}

struct LiveChannelsWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.live-channels"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: ChannelsLiveWidgetProvider()) { entry in
            ChannelsEntryView(entry: entry, videoType: .live)
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
            ChannelsEntryView(entry: entry, videoType: .upcoming)
        }
        .configurationDisplayName("UPCOMING_CHANNELS_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_CHANNELS_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}

struct PastChannelsWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.past-channels"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: PastWidgetIntent.self, provider: ChannelsPastWidgetProvider()) { entry in
            ChannelsEntryView(entry: entry, videoType: .past)
        }
        .configurationDisplayName("PAST_CHANNELS_WIDGET_DISPLAY_NAME")
        .description("PAST_CHANNELS_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}
