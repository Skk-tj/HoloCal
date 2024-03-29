//
//  VideoCountEntry.swift
//  holo-wtf
//
//
//

import Foundation

struct VideoCountEntry: VideoTimelineEntry {
    let date: Date
    let status: WidgetDataStatus
    let count: Int
    
    let agency: WidgetDeepLinkAgency
}

struct AppIntentVideoCountEntry: AppIntentVideoTimelineEntry {
    let date: Date
    let status: WidgetDataStatus
    let count: Int
    
    let agency: IntentAgencyAppEnum?
}
