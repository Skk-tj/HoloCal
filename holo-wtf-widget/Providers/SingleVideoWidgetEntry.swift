//
//  SingleVideoEntry.swift
//  holo-wtf-widgetExtension
//
//
//

import Foundation

struct SingleVideoWidgetEntry: VideoTimelineEntry {
    let date: Date
    let status: WidgetDataStatus
    
    let video: (any LiveVideo)?
    
    let avatarData: Data
    let thumbnailData: Data
}
