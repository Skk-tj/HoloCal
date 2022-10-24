//
//  ChannelsEntry.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-10-06.
//

import Foundation

struct ChannelsEntry: VideoTimelineEntry {
    let date: Date
    let status: WidgetDataStatus
    
    let channels: [any Channel]
    let thumbnails: [Data]
}
