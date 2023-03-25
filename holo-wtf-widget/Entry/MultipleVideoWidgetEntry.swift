//
//  MultipleVideoWidgetEntry.swift
//  holo-wtf-widgetExtension
//
//
//

import Foundation

struct MultipleVideoWidgetEntry: VideoTimelineEntry {
    let date: Date
    let status: WidgetDataStatus
    
    let videos: [LiveVideo]
    let thumbnails: [Data]
    
    let agency: WidgetDeepLinkAgency
}
