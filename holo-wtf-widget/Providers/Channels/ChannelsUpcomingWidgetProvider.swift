//
//  ChannelsUpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct ChannelsUpcomingWidgetProvider: ChannelsIntentTimelineProvider {
    typealias Entry = ChannelsEntry
    typealias Intent = UpcomingWidgetIntent
    
    let videoType: VideoType = .upcoming
    let sortBy: IntentSortBy = .mostRecent
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentChannelsUpcomingWidgetProvider: ChannelsAppIntentTimelineProvider {
    typealias Entry = AppIntentChannelsEntry
    typealias Intent = UpcomingWidget
    
    let videoType: VideoType = .upcoming
    let sortBy: IntentSortByAppEnum = .mostRecent
}
