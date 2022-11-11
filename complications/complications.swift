//
//  complications.swift
//  complications
//
//  Created by Haoyi An on 2022-09-18.
//

import WidgetKit
import SwiftUI

struct LiveAccessoryCornerWidget: Widget {
    let kind: String = "LiveAccessoryCornerWidget"
    
    var body: some WidgetConfiguration {
        if #available(iOSApplicationExtension 16.0, *) {
            return StaticConfiguration(kind: kind, provider: VideoWidgetProvider(url: hololiveLiveURL, sortStrategy: liveSortStrategy)) { entry in
                LiveAccessoryCornerEntryView(entry: entry)
            }
            .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
            .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
            .supportedFamilies([.accessoryCorner])
        } else {
            return EmptyWidgetConfiguration()
        }
    }
}

struct UpcomingAccessoryCornerWidget: Widget {
    let kind: String = "UpcomingAccessoryCornerWidget"
    
    var body: some WidgetConfiguration {
        if #available(iOSApplicationExtension 16.0, *) {
            return StaticConfiguration(kind: kind, provider: VideoWidgetProvider(url: hololiveWidgetUpcomingURL, sortStrategy: upcomingSortStrategy)) { entry in
                UpcomingAccessoryCornerEntryView(entry: entry)
            }
            .configurationDisplayName("UPCOMING_WIDGET_DISPLAY_NAME")
            .description("UPCOMING_WIDGET_DESCRIPTION")
            .supportedFamilies([.accessoryCorner])
        } else {
            return EmptyWidgetConfiguration()
        }
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