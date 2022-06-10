//
//  holo_wtf_widget.swift
//  holo-wtf-widget
//
//
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

struct SmallLiveWidgetEntryView: View {
    var entry: LiveWidgetProvider.Entry
    
    var body: some View {
        switch entry.status {
        case .ok:
            if let video = entry.video {
                SmallLiveWidgetView(live: video, avatarData: entry.avatarData)
            } else {
                Text("NO_ONE_IS_STREAMING")
            }
        case .noVideo:
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            }
        case .network:
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NETWORK_ERROR")
                
                Spacer()
            }
        }
    }
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
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            }
        case .network:
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NETWORK_ERROR")
                
                Spacer()
            }
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
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            }
        case .network:
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NETWORK_ERROR")
                
                Spacer()
            }
        }
    }
}

struct SmallLiveWidget: Widget {
    let kind: String = "SmallLiveWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: LiveWidgetProvider()) { entry in
            SmallLiveWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("CURRENTLY_LIVE_WIDGET_DISPLAY_NAME")
        .description("CURRENTLY_LIVE_WIDGET_DESCRIPTION")
        .supportedFamilies([.systemSmall])
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
