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
