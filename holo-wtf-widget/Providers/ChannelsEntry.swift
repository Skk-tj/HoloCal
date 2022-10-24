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
    
    let channels: [any Channel]
    let thumbnails: [Data]
}
