//
//  holo_wtf_widget.swift
//  holo-wtf-widget
//
//
//

import WidgetKit
import SwiftUI
import Intents

enum WidgetDataStatus {
    case ok
    case noVideo
    case network
}

struct LivePaneWidgetEntryView: View {
    var entry: LiveWidgetProvider.Entry
    
    var body: some View {
        switch entry.status {
        case .ok:
            if let video = entry.video {
                LiveWidgetView(live: video, thumbnailData: entry.thumbnailData, avatarData: entry.avatarData)
            } else {
                Text("NO_ONE_IS_STREAMING")
            }
        case .noVideo:
            Text("NO_ONE_IS_STREAMING")
            
        case .network:
            Text("NETWORK_ERROR")
        }
    }
}

struct MultipleLiveWidgetEntryView: View {
    var entry: MultipleLiveWidgetProvider.Entry
    
    var body: some View {
        switch entry.status {
        case .ok:
            if let videoLeft = entry.videoLeft {
                MultipleLiveWidgetView(leftVideo: videoLeft, leftVideoThumbnail: entry.thumbnailDataLeft, rightVideo: entry.videoRight, rightVideoThumbnail: entry.thumbnailDataRight)
            }
        case .noVideo:
            Text("NO_ONE_IS_STREAMING")
        case .network:
            Text("NETWORK_ERROR")
        }
    }
}

@main
struct HoloCalWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        LivePaneWidget()
        MultipleLiveWidget()
    }
}

struct LivePaneWidget: Widget {
    let kind: String = "LivePaneWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: LiveWidgetProvider()) { entry in
            LivePaneWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemLarge])
    }
}

struct MultipleLiveWidget: Widget {
    let kind: String = "MultipleLiveWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: MultipleLiveWidgetProvider()) { entry in
            MultipleLiveWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("MULTIPLE_CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("MULTIPLE_CURRENTLY_LIVE_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemMedium])
    }
}

struct holo_wtf_widget_Previews: PreviewProvider {
    static var previews: some View {
        let channel: Channel = .init(id: "sampleChannelId", name: "Cp6993wxpyDPHUpavwDFqgg", photo: nil, org: "Hololive")
        
        let video: LiveVideo = .init(id: "sampleId", title: "My Debut Stream!", topicId: "debut", startScheduled: Date(), startActual: Date(), liveViewers: 1000, channel: channel)
        
        LivePaneWidgetEntryView(entry: LiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), video: video, status: .ok, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
