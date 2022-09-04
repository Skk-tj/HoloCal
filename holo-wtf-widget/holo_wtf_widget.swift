//
//  holo_wtf_widget.swift
//  holo-wtf-widget
//
//  Created by Haoyi An on 2022-05-11.
//

import WidgetKit
import SwiftUI
import Intents

protocol VideoTimelineEntry: TimelineEntry {
    var status: WidgetDataStatus { get }
}

enum WidgetDataStatus {
    case ok
    case noVideo
    case network
}

@main
struct HoloCalWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        SmallLiveWidget()
        LivePaneWidget()
        MultipleLiveWidget()
        SmallUpcomingWidget()
        HoloCalWidgetBundle2().body
    }
}

struct HoloCalWidgetBundle2: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        UpcomingPaneWidget()
        MultipleUpcomingWidget()
    }
}

struct holo_wtf_widget_Previews: PreviewProvider {
    static var previews: some View {
        SmallLiveWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), configuration: ConfigurationIntent(), video: LiveVideo.previewLive, status: .ok, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        SmallLiveWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), configuration: ConfigurationIntent(), video: LiveVideo.previewLive, status: .network, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        LivePaneWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), configuration: ConfigurationIntent(), video: LiveVideo.previewLive, status: .ok, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        
        LivePaneWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), configuration: ConfigurationIntent(), video: LiveVideo.previewLive, status: .noVideo, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        
        MultipleLiveWidgetEntryView(entry: MultipleVideoWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .noVideo))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        
        MultipleLiveWidgetEntryView(entry: MultipleVideoWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .network))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
