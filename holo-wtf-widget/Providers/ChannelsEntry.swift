//
//  ChannelsEntry.swift
//  holo-wtf
//
//
//

import Foundation

struct ChannelsEntry: VideoTimelineEntry {
    let date: Date
    let status: WidgetDataStatus
    
    let channels: [Channel]
    let thumbnails: [Data]
}