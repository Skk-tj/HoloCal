//
//  AccessoryInlineEntryView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryInlineEntryView: View {
    let entry: SingleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        if let video = entry.video {
            AccessoryInlineWidgetView(video: video, videoType: videoType)
                .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency.rawValue)))
        } else {
            switch videoType {
            case .live:
                Text("\(Image(systemName: "person.wave.2.fill")) NO_ONE_IS_STREAMING")
            case .upcoming:
                Text("\(Image(systemName: "clock")) NO_ONE_IS_STREAMING")
            case .past:
                Text("\(Image(systemName: "clock.arrow.circlepath")) NO_ONE_IS_STREAMING")
            }
        }
    }
}
