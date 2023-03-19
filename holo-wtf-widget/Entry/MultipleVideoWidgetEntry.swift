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
    
    let videoLeft: LiveVideo?
    let thumbnailDataLeft: Data
    
    let videoRight: LiveVideo?
    let thumbnailDataRight: Data
    
    let agency: WidgetDeepLinkAgency
}
