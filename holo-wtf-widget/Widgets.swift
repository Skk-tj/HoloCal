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
        makeWidgetConfiguration()
            .configurationDisplayName("MULTIPLE_CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
            .description("MULTIPLE_CURRENTLY_LIVE_WIDGET_DESCRIPTION")
            .supportedFamilies([.systemMedium])
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: LiveWidget.self, provider: AppIntentMultipleVideoLiveWidgetProvider(prefix: 2, imageGet: .thumbnail)) { entry in
                AppIntentMultipleWidgetEntryView(entry: entry, videoType: .live)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: MultipleVideoLiveWidgetProvider(prefix: 2, imageGet: .thumbnail)) { entry in
                MultipleWidgetEntryView(entry: entry, videoType: .live)
            }
        }
    }
}

struct MultipleUpcomingWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.multiple-upcoming"
    
    var body: some WidgetConfiguration {
        makeWidgetConfiguration()
            .configurationDisplayName("MULTIPLE_UPCOMING_WIDGET_DISPLAY_NAME")
            .description("MULTIPLE_UPCOMING_WIDGET_DESCRIPTION")
            .supportedFamilies([.systemMedium])
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: UpcomingWidget.self, provider: AppIntentMultipleVideoUpcomingWidgetProvider(prefix: 2, imageGet: .thumbnail)) { entry in
                AppIntentMultipleWidgetEntryView(entry: entry, videoType: .upcoming)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: UpcomingWidgetIntent.self, provider: MultipleVideoUpcomingWidgetProvider(prefix: 2, imageGet: .thumbnail)) { entry in
                MultipleWidgetEntryView(entry: entry, videoType: .upcoming)
            }
        }
    }
}

struct MultiplePastWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.multiple-past"
    
    var body: some WidgetConfiguration {
        makeWidgetConfiguration()
            .configurationDisplayName("MULTIPLE_PAST_WIDGET_DISPLAY_NAME")
            .description("MULTIPLE_PAST_WIDGET_DESCRIPTION")
            .supportedFamilies([.systemMedium])
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: PastWidget.self, provider: AppIntentMultipleVideoPastWidgetProvider(prefix: 2, imageGet: .thumbnail)) { entry in
                AppIntentMultipleWidgetEntryView(entry: entry, videoType: .past)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: PastWidgetIntent.self, provider: MultipleVideoPastWidgetProvider(prefix: 2, imageGet: .thumbnail)) { entry in
                MultipleWidgetEntryView(entry: entry, videoType: .past)
            }
        }
    }
}

struct MultipleLiveLargeWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.multiple-live-large"
    
    var body: some WidgetConfiguration {
        makeWidgetConfiguration()
            .configurationDisplayName("MULTIPLE_CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
            .description("MULTIPLE_CURRENTLY_LIVE_WIDGET_DESCRIPTION")
            .supportedFamilies([.systemLarge])
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: LiveWidget.self, provider: AppIntentMultipleVideoLiveWidgetProvider(prefix: 5, imageGet: .avatar)) { entry in
                AppIntentMultipleVideoLargeEntryView(entry: entry, videoType: .live)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: MultipleVideoLiveWidgetProvider(prefix: 5, imageGet: .avatar)) { entry in
                MultipleVideoLargeEntryView(entry: entry, videoType: .live)
            }
        }
    }
}

struct MultipleUpcomingLargeWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.multiple-upcoming-large"
    
    var body: some WidgetConfiguration {
        makeWidgetConfiguration()
            .configurationDisplayName("MULTIPLE_UPCOMING_WIDGET_DISPLAY_NAME")
            .description("MULTIPLE_UPCOMING_WIDGET_DESCRIPTION")
            .supportedFamilies([.systemLarge])
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: UpcomingWidget.self, provider: AppIntentMultipleVideoUpcomingWidgetProvider(prefix: 5, imageGet: .avatar)) { entry in
                AppIntentMultipleVideoLargeEntryView(entry: entry, videoType: .upcoming)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: UpcomingWidgetIntent.self, provider: MultipleVideoUpcomingWidgetProvider(prefix: 5, imageGet: .avatar)) { entry in
                MultipleVideoLargeEntryView(entry: entry, videoType: .upcoming)
            }
        }
    }
}

struct MultiplePastLargeWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.multiple-past-large"
    
    var body: some WidgetConfiguration {
        makeWidgetConfiguration()
            .configurationDisplayName("MULTIPLE_PAST_WIDGET_DISPLAY_NAME")
            .description("MULTIPLE_PAST_WIDGET_DESCRIPTION")
            .supportedFamilies([.systemLarge])
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: PastWidget.self, provider: AppIntentMultipleVideoPastWidgetProvider(prefix: 5, imageGet: .avatar)) { entry in
                AppIntentMultipleVideoLargeEntryView(entry: entry, videoType: .past)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: PastWidgetIntent.self, provider: MultipleVideoPastWidgetProvider(prefix: 5, imageGet: .avatar)) { entry in
                MultipleVideoLargeEntryView(entry: entry, videoType: .past)
            }
        }
    }
}

struct LiveChannelsWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.live-channels"
    
    var body: some WidgetConfiguration {
        makeWidgetConfiguration()
            .configurationDisplayName("LIVE_CHANNELS_WIDGET_DISPLAY_NAME")
            .description("LIVE_CHANNELS_WIDGET_DESCRIPTION")
            .supportedFamilies([.systemMedium])
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: LiveWidget.self, provider: AppIntentChannelsLiveWidgetProvider()) { entry in
                AppIntentChannelsEntryView(entry: entry, videoType: .live)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: ChannelsLiveWidgetProvider()) { entry in
                ChannelsEntryView(entry: entry, videoType: .live)
            }
        }
    }
}

struct UpcomingChannelsWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.upcoming-channels"
    
    var body: some WidgetConfiguration {
        makeWidgetConfiguration()
            .configurationDisplayName("UPCOMING_CHANNELS_WIDGET_DISPLAY_NAME")
            .description("UPCOMING_CHANNELS_WIDGET_DESCRIPTION")
            .supportedFamilies([.systemMedium])
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: UpcomingWidget.self, provider: AppIntentChannelsUpcomingWidgetProvider()) { entry in
                AppIntentChannelsEntryView(entry: entry, videoType: .upcoming)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: UpcomingWidgetIntent.self, provider: ChannelsUpcomingWidgetProvider()) { entry in
                ChannelsEntryView(entry: entry, videoType: .upcoming)
            }
        }
    }
}

struct PastChannelsWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.past-channels"
    
    var body: some WidgetConfiguration {
        makeWidgetConfiguration()
            .configurationDisplayName("PAST_CHANNELS_WIDGET_DISPLAY_NAME")
            .description("PAST_CHANNELS_WIDGET_DESCRIPTION")
            .supportedFamilies([.systemMedium])
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: PastWidget.self, provider: AppIntentChannelsPastWidgetProvider()) { entry in
                AppIntentChannelsEntryView(entry: entry, videoType: .past)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: PastWidgetIntent.self, provider: ChannelsPastWidgetProvider()) { entry in
                ChannelsEntryView(entry: entry, videoType: .past)
            }
        }
    }
}
