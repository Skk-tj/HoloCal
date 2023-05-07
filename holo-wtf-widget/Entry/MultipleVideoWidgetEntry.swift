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
    let images: [Data]
    
    let agency: WidgetDeepLinkAgency
}
