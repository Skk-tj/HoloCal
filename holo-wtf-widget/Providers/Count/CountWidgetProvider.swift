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
