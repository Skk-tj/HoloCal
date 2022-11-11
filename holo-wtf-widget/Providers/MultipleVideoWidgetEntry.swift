//
//  MultipleVideoWidgetEntry.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-09-01.
//

import Foundation

struct MultipleVideoWidgetEntry: VideoTimelineEntry {
    let date: Date
    let status: WidgetDataStatus
    
    let videoLeft: (LiveVideo)?
    let thumbnailDataLeft: Data
    
    let videoRight: (LiveVideo)?
    let thumbnailDataRight: Data
}
