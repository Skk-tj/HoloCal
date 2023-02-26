//
//  ChannelsUpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct ChannelsUpcomingWidgetProvider: ChannelIntentTimelineProvider {
    typealias Entry = ChannelsEntry
    typealias Intent = UpcomingWidgetIntent
    
    let videoType: VideoType = .upcoming
    let sortBy: IntentSortBy = .mostRecent
}
