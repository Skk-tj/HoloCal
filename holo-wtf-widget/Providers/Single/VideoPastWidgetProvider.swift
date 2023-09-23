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

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentVideoPastWidgetProvider: VideoAppIntentTimelineProvider {
    typealias Entry = AppIntentSingleVideoWidgetEntry
    typealias Intent = PastWidget
    
    let videoType: VideoType = .past
    let sortBy: IntentSortByAppEnum = .mostRecent
}
