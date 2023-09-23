//
//  ChannelsPastWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct ChannelsPastWidgetProvider: ChannelsIntentTimelineProvider {
    typealias Entry = ChannelsEntry
    typealias Intent = PastWidgetIntent
    
    let videoType: VideoType = .past
    let sortBy: IntentSortBy = .mostRecent
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentChannelsPastWidgetProvider: ChannelsAppIntentTimelineProvider {
    typealias Entry = AppIntentChannelsEntry
    typealias Intent = PastWidget
    
    let videoType: VideoType = .past
    let sortBy: IntentSortByAppEnum = .mostRecent
}
