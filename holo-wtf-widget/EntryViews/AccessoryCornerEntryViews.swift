//
//  AccessoryCornerEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryCornerEntryView: View {
    var entry: SingleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        if let video = entry.video {
            AccessoryCornerView(video: video, videoType: videoType)
                .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, WidgetDeepLinkAgency.hololive.rawValue)))
        } else {
            ZStack {
                AccessoryWidgetBackground()
                switch videoType {
                case .live:
                    Image(systemName: "person.wave.2.fill")
                        .font(.title.bold())
                case .upcoming:
                    Image(systemName: "clock")
                        .font(.title.bold())
                case .past:
                    Image(systemName: "clock.arrow.circlepath")
                        .font(.title.bold())
                }
            }
            .widgetAccentable()
            .widgetLabel {
                Text("NO_ONE_IS_STREAMING")
            }
        }
    }
}
