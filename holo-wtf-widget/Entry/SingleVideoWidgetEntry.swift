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
    
    let video: LiveVideo?
    
    let avatarData: Data
    let thumbnailData: Data
    
    let agency: WidgetDeepLinkAgency
}
