//
//  MultipleVideoPastWidgetProvider.swift
//  holo-wtf
//
//
//

import WidgetKit

struct MultipleVideoPastWidgetProvider: MultipleVideoIntentTimelineProvider {
    typealias Entry = MultipleVideoWidgetEntry
    typealias Intent = PastWidgetIntent
    
    let videoType: VideoType = .past
    let sortBy: IntentSortBy = .mostRecent
}
