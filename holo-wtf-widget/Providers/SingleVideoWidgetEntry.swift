//
//  SingleVideoEntry.swift
//  holo-wtf-widgetExtension
//
//
//

import Foundation

struct SingleVideoWidgetEntry: VideoTimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let video: LiveVideo?
    let status: WidgetDataStatus
    
    let avatarData: Data
    let thumbnailData: Data
}
