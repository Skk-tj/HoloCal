//
//  MultipleVideoUpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct MultipleVideoUpcomingWidgetProvider: MultipleVideoIntentTimelineProvider {
    typealias Entry = MultipleVideoWidgetEntry
    typealias Intent = UpcomingWidgetIntent
    
    let videoType: VideoType = .upcoming
    let sortBy: IntentSortBy = .mostRecent
    
    let prefix: Int
    let imageGet: MultipleVideoImageGetMethod
    
    init(prefix: Int, imageGet: MultipleVideoImageGetMethod) {
        self.prefix = prefix
        self.imageGet = imageGet
    }
}
