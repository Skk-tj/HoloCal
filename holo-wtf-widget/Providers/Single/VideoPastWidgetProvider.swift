//
//  VideoPastWidgetProvider.swift
//  holo-wtf
//
//
//

import WidgetKit

struct VideoPastWidgetProvider: VideoIntentTimelineProvider {
    typealias Entry = SingleVideoWidgetEntry
    typealias Intent = PastWidgetIntent
    
    let videoType: VideoType = .past
    let sortBy: IntentSortBy = .mostRecent
}
