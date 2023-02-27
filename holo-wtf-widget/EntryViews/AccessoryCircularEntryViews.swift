//
//  AccessoryCircularEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryCircularEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            AccessoryCircularView(video: video, avatarData: entry.avatarData)
        } else {
            Text("N/A")
        }
    }
}
