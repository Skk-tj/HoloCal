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
    
    let channels: ArraySlice<Channel>
    let thumbnails: [Data]
    
    let agency: WidgetDeepLinkAgency
}
