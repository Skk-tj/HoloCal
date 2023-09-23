//
//  AccessoryCornerEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryCornerEntryView: View {
    let entry: SingleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        if let video = entry.video {
            AccessoryCornerView(video: video, videoType: videoType)
                .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency.rawValue)))
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
            .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency.rawValue)))
        }
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentAccessoryCornerEntryView: View {
    let entry: AppIntentSingleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        if let video = entry.video {
            AccessoryCornerView(video: video, videoType: videoType)
                .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency?.rawValue ?? "")))
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
            .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency?.rawValue ?? "")))
        }
    }
}

struct AccessoryCornerEntryView_Preview: PreviewProvider {
    static var previews: some View {
        AccessoryCornerEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .ok, video: LiveVideo.previewLive, avatarData: Data(), thumbnailData: Data(), agency: .hololive), videoType: .live)
#if os(watchOS)
            .previewContext(WidgetPreviewContext(family: .accessoryCorner))
#endif
        
        AccessoryCornerEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .ok, video: nil, avatarData: Data(), thumbnailData: Data(), agency: .hololive), videoType: .live)
#if os(watchOS)
            .previewContext(WidgetPreviewContext(family: .accessoryCorner))
#endif
        
        AccessoryCornerEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .ok, video: nil, avatarData: Data(), thumbnailData: Data(), agency: .hololive), videoType: .live)
            .environment(\.locale, .init(identifier: "ja"))
#if os(watchOS)
            .previewContext(WidgetPreviewContext(family: .accessoryCorner))
#endif
    }
}
