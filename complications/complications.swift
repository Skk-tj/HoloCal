//
//  complications.swift
//  complications
//
//
//

import WidgetKit
import SwiftUI

struct LiveAccessoryCornerWidget: Widget {
    let kind: String = "LiveAccessoryCornerWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: LiveWidgetIntent.self, provider: VideoLiveWidgetProvider()) { entry in
            LiveAccessoryCornerEntryView(entry: entry)
        }
        .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
        .supportedFamilies([.accessoryCorner])
    }
}

struct UpcomingAccessoryCornerWidget: Widget {
    let kind: String = "UpcomingAccessoryCornerWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: UpcomingWidgetIntent.self, provider: VideoUpcomingWidgetProvider()) { entry in
            UpcomingAccessoryCornerEntryView(entry: entry)
        }
        .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
        .description("UPCOMING_WIDGET_DESCRIPTION")
        .supportedFamilies([.accessoryCorner])
    }
}

@main
struct ComplicationsWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        LiveAccessoryRectangularWidget()
        UpcomingAccessoryRectangularWidget()
        LiveAccessoryCornerWidget()
        UpcomingAccessoryCornerWidget()
    }
}

struct complications_Previews: PreviewProvider {
    static var previews: some View {
        LiveAccessoryRectangularWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .ok, video: LiveVideo.previewLive, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
