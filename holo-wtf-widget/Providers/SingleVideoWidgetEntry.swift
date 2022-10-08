//
//  SingleVideoEntry.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-06-10.
//

import Foundation

struct SingleVideoWidgetEntry: VideoTimelineEntry {
    let date: Date
    let status: WidgetDataStatus
    
    let video: LiveVideo?
    
    let avatarData: Data
    let thumbnailData: Data
}
