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
    
    let agency: WidgetDeepLinkAgency
}

struct AppIntentChannelsEntry: AppIntentVideoTimelineEntry {
    let date: Date
    let status: WidgetDataStatus
    
    let channels: [Channel]
    let thumbnails: [Data]
    
    let agency: IntentAgencyAppEnum?
}
