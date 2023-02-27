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
