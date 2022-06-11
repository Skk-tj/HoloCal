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
    }
}

struct holo_wtf_widget_Previews: PreviewProvider {
    static var previews: some View {
        let channel: Channel = .init(id: "sampleChannelId", name: "Cp6993wxpyDPHUpavwDFqgg", photo: nil, org: "Hololive")
        
        let video: LiveVideo = .init(id: "sampleId", title: "My Debut Stream!", topicId: "debut", startScheduled: Date(), startActual: Date(), liveViewers: 1000, channel: channel)
        
        LivePaneWidgetEntryView(entry: LiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), video: video, status: .ok, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        
        LivePaneWidgetEntryView(entry: LiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), video: video, status: .noVideo, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        
        MultipleLiveWidgetEntryView(entry: MultipleLiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .noVideo))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        
        MultipleLiveWidgetEntryView(entry: MultipleLiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .network))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
