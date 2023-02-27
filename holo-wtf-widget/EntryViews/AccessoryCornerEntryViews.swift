//
//  AccessoryCornerEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct LiveAccessoryCornerEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            LiveAccessoryCornerView(live: video)
        } else {
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "person.wave.2.fill")
                    .font(.title.bold())
            }
            .widgetAccentable()
            .widgetLabel {
                Text("NO_ONE_IS_STREAMING")
            }
        }
    }
}

struct UpcomingAccessoryCornerEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            UpcomingAccessoryCornerView(upcoming: video)
        } else {
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "clock")
                    .font(.title.bold())
            }
            .widgetAccentable()
            .widgetLabel {
                Text("NO_ONE_IS_STREAMING")
            }
        }
    }
}

struct PastAccessoryCornerEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            PastAccessoryCornerView(past: video)
        } else {
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "clock.arrow.circlepath")
                    .font(.title.bold())
            }
            .widgetAccentable()
            .widgetLabel {
                Text("NO_ONE_IS_STREAMING")
            }
        }
    }
}
