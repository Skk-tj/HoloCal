//
//  Widgets.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit
import SwiftUI

struct SmallLiveWidget: Widget {
    let kind: String = "SmallLiveWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VideoWidgetProvider(url: hololiveLiveURL, sortStrategy: liveSortStrategy)) { entry in
            SmallLiveWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemSmall])
    }
}

struct LivePaneWidget: Widget {
    let kind: String = "LivePaneWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VideoWidgetProvider(url: hololiveLiveURL, sortStrategy: liveSortStrategy)) { entry in
            LivePaneWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemLarge])
    }
}

struct MultipleLiveWidget: Widget {
    let kind: String = "MultipleLiveWidget"
    
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
    let kind: String = "SmallUpcomingWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VideoWidgetProvider(url: hololiveWidgetUpcomingURL, sortStrategy: upcomingSortStrategy)) { entry in
            SmallUpcomingWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemSmall])
    }
}

struct UpcomingPaneWidget: Widget {
    let kind: String = "UpcomingPaneWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VideoWidgetProvider(url: hololiveWidgetUpcomingURL, sortStrategy: upcomingSortStrategy)) { entry in
            UpcomingPaneWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemLarge])
    }
}

struct MultipleUpcomingWidget: Widget {
    let kind: String = "MultipleUpcomingWidget"
    
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
    let kind: String = "LiveChannelsWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: LiveChannelsWidgetProvider()) { entry in
            LiveChannelsEntryView(entry: entry)
        }
        .configurationDisplayName("LIVE_CHANNELS_WIDGET_DISPLAY_NAME")
        .description("LIVE_CHANNELS_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}
