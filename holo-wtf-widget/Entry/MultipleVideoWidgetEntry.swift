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
    
    let videos: ArraySlice<LiveVideo>
    let thumbnails: [Data]
    
    let agency: WidgetDeepLinkAgency
}
