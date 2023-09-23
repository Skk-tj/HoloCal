//
//  AccessoryCircularEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryCircularEntryView: View {
    let entry: VideoLiveWidgetProvider.Entry
    let videoType: VideoType
    
    var body: some View {
        if let video = entry.video {
            AccessoryCircularView(video: video, avatarData: entry.avatarData)
                .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency.rawValue)))
        } else {
            Text("N/A")
                .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency.rawValue)))
        }
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentAccessoryCircularEntryView: View {
    let entry: AppIntentVideoLiveWidgetProvider.Entry
    let videoType: VideoType
    
    var body: some View {
        if let video = entry.video {
            AccessoryCircularView(video: video, avatarData: entry.avatarData)
                .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency?.rawValue ?? "")))
        } else {
            Text("N/A")
                .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency?.rawValue ?? "")))
        }
    }
}
