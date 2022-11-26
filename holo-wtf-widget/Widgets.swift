//
//  Widgets.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-06-10.
//

import WidgetKit
import SwiftUI

struct SmallLiveWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.small-live"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: SelectAgencyIntent.self, provider: VideoWidgetProviderWithIntent(videoType: .live, sortStrategy: liveSortStrategy)) { entry in
            SmallLiveWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemSmall])
    }
}

struct LivePaneWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.live-pane"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: SelectAgencyIntent.self, provider: VideoWidgetProviderWithIntent(videoType: .live, sortStrategy: liveSortStrategy)) { entry in
            LivePaneWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemLarge])
    }
}

struct MultipleLiveWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.multiple-live"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MultipleVideoWidgetProvider(url: hololiveLiveURL, sortStrategy: liveSortStrategy)) { entry in
            MultipleLiveWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("MULTIPLE_CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("MULTIPLE_CURRENTLY_LIVE_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}

struct SmallUpcomingWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.small-upcoming"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: SelectAgencyIntent.self, provider: VideoWidgetProviderWithIntent(videoType: .upcoming, sortStrategy: liveSortStrategy)) { entry in
            SmallUpcomingWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemSmall])
    }
}

struct UpcomingPaneWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.upcoming-pane"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: SelectAgencyIntent.self, provider: VideoWidgetProviderWithIntent(videoType: .upcoming, sortStrategy: liveSortStrategy)) { entry in
            UpcomingPaneWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemLarge])
    }
}

struct MultipleUpcomingWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.multiple-upcoming"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MultipleVideoWidgetProvider(url: hololiveWidgetUpcomingURL, sortStrategy: upcomingSortStrategy)) { entry in
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
        StaticConfiguration(kind: kind, provider: ChannelsWidgetProvider(url: hololiveLiveURL, sortStrategy: liveSortStrategy)) { entry in
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
        StaticConfiguration(kind: kind, provider: ChannelsWidgetProvider(url: hololiveWidgetUpcomingURL, sortStrategy: upcomingSortStrategy)) { entry in
            UpcomingChannelsEntryView(entry: entry)
        }
        .configurationDisplayName("UPCOMING_CHANNELS_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_CHANNELS_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}
