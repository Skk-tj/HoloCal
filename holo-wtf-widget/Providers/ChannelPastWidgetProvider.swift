//
//  ChannelPastWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct ChannelPastWidgetProvider: ChannelIntentTimelineProvider {
    typealias Entry = ChannelsEntry
    typealias Intent = PastWidgetIntent
    
    let videoType: VideoType = .past
    let sortBy: IntentSortBy = .mostRecent
}
