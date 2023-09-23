//
//  VideoUpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct VideoUpcomingWidgetProvider: VideoIntentTimelineProvider {
    typealias Entry = SingleVideoWidgetEntry
    typealias Intent = UpcomingWidgetIntent
    
    let videoType: VideoType = .upcoming
    let sortBy: IntentSortBy = .mostRecent
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentVideoUpcomingWidgetProvider: VideoAppIntentTimelineProvider {
    typealias Entry = AppIntentSingleVideoWidgetEntry
    typealias Intent = UpcomingWidget
    
    let videoType: VideoType = .upcoming
    let sortBy: IntentSortByAppEnum = .mostRecent
}
