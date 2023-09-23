//
//  CountWidgetProvider.swift
//  holo-wtf
//
//
//

import Foundation
import WidgetKit

struct CountLiveWidgetProvider: CountIntentTimelineProvider {
    typealias Entry = VideoCountEntry
    typealias Intent = LiveWidgetIntent
    
    let videoType: VideoType = .live
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentCountLiveWidgetProvider: CountAppIntentTimelineProvider {
    typealias Entry = AppIntentVideoCountEntry
    typealias Intent = LiveWidget
    
    let videoType: VideoType = .live
}
