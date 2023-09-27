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

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentMultipleVideoUpcomingWidgetProvider: MultipleVideoAppIntentTimelineProvider {
    typealias Entry = AppIntentMultipleVideoWidgetEntry
    typealias Intent = UpcomingWidget
    
    let videoType: VideoType = .upcoming
    let sortBy: IntentSortByAppEnum = .mostRecent
    
    let prefix: Int
    let imageGet: MultipleVideoImageGetMethod
    
    init(prefix: Int, imageGet: MultipleVideoImageGetMethod) {
        self.prefix = prefix
        self.imageGet = imageGet
    }
}
