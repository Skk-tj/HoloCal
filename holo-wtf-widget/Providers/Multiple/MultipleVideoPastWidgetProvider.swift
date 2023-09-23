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
    
    let prefix: Int
    let imageGet: MultipleVideoImageGetMethod
    
    init(prefix: Int, imageGet: MultipleVideoImageGetMethod) {
        self.prefix = prefix
        self.imageGet = imageGet
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentMultipleVideoPastWidgetProvider: MultipleVideoAppIntentTimelineProvider {
    typealias Entry = AppIntentMultipleVideoWidgetEntry
    typealias Intent = PastWidget
    
    let videoType: VideoType = .past
    let sortBy: IntentSortByAppEnum = .mostRecent
    
    let prefix: Int
    let imageGet: MultipleVideoImageGetMethod
    
    init(prefix: Int, imageGet: MultipleVideoImageGetMethod) {
        self.prefix = prefix
        self.imageGet = imageGet
    }
}
