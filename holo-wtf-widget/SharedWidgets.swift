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
        makeWidgetConfiguration()
            .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
            .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
#if os(watchOS)
            .supportedFamilies([.accessoryRectangular, .accessoryCorner, .accessoryInline])
#else
            .supportedFamilies([.systemSmall, .systemLarge, .accessoryRectangular, .accessoryCircular, .accessoryInline])
#endif
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: LiveWidget.self, provider: AppIntentVideoLiveWidgetProvider()) { entry in
                AppIntentVideoWidgetEntryView(entry: entry, videoType: .live)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: VideoLiveWidgetProvider()) { entry in
                VideoWidgetEntryView(entry: entry, videoType: .live)
            }
        }
    }
}

struct SingleUpcomingWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.upcoming-single"
    
    var body: some WidgetConfiguration {
        makeWidgetConfiguration()
            .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
            .description("UPCOMING_WIDGET_DESCRIPTION")
#if os(watchOS)
            .supportedFamilies([.accessoryRectangular, .accessoryCorner, .accessoryInline])
#else
            .supportedFamilies([.systemSmall, .systemLarge, .accessoryRectangular, .accessoryCircular, .accessoryInline])
#endif
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: UpcomingWidget.self, provider: AppIntentVideoUpcomingWidgetProvider()) { entry in
                AppIntentVideoWidgetEntryView(entry: entry, videoType: .upcoming)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: UpcomingWidgetIntent.self, provider: VideoUpcomingWidgetProvider()) { entry in
                VideoWidgetEntryView(entry: entry, videoType: .live)
            }
        }
    }
}

struct SinglePastWidget: Widget {
    let kind: String = "io.skk-tj.holo-wtf-widget.past-single"
    
    var body: some WidgetConfiguration {
        makeWidgetConfiguration()
            .configurationDisplayName("PAST_WIDGET_DISPLAY_NAME")
            .description("PAST_WIDGET_DESCRIPTION")
#if os(watchOS)
            .supportedFamilies([.accessoryRectangular, .accessoryCorner, .accessoryInline])
#else
            .supportedFamilies([.systemSmall, .systemLarge, .accessoryRectangular, .accessoryCircular, .accessoryInline])
#endif
    }
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: PastWidget.self, provider: AppIntentVideoPastWidgetProvider()) { entry in
                AppIntentVideoWidgetEntryView(entry: entry, videoType: .past)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: PastWidgetIntent.self, provider: VideoPastWidgetProvider()) { entry in
                VideoWidgetEntryView(entry: entry, videoType: .past)
            }
        }
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
    
    func makeWidgetConfiguration() -> some WidgetConfiguration {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, *) {
            return AppIntentConfiguration(kind: kind, intent: LiveWidget.self, provider: AppIntentCountLiveWidgetProvider()) { entry in
                AppIntentAccessoryWatchCircularEntryViews(entry: entry, videoType: .past)
            }
        } else {
            return IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: CountLiveWidgetProvider()) { entry in
                AccessoryWatchCircularEntryViews(entry: entry, videoType: .live)
            }
        }
    }
}
