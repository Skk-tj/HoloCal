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
