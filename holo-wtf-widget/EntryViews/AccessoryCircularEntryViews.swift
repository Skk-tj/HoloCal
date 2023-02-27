//
//  AccessoryCircularEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct LiveAccessoryCircularWidgetEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            LiveAccessoryCircularView(live: video, avatarData: entry.avatarData)
        } else {
            Text("N/A")
        }
    }
}

struct UpcomingAccessoryCircularWidgetEntryView: View {
    var entry: VideoUpcomingWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            LiveAccessoryCircularView(live: video, avatarData: entry.avatarData)
        } else {
            Text("N/A")
        }
    }
}

struct PastAccessoryCircularWidgetEntryView: View {
    var entry: VideoPastWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            LiveAccessoryCircularView(live: video, avatarData: entry.avatarData)
        } else {
            Text("N/A")
        }
    }
}
