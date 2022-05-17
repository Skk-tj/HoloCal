//
//  holo_wtf_widget.swift
//  holo-wtf-widget
//
//  Created by Haoyi An on 2022-05-11.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        let channel: Channel = .init(id: "sampleChannelId", name: "Cp6993wxpyDPHUpavwDFqgg", photo: nil, org: "Hololive")
        
        let video: LiveVideo = .init(id: "sampleId", title: "My Debut Stream!", topicId: "debut", startScheduled: Date(), startActual: Date(), liveViewers: 1000, channel: channel)
        
        return SimpleEntry(date: Date(), configuration: ConfigurationIntent(), video: video, avatarData: Data(), thumbnailData: Data())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        Task {
            do {
                let lives = try await VideoFetchService.shared.getVideos(from: "https://holodex.net/api/v2/live?org=Hololive&status=live&type=stream")
                
                let firstVideo = lives[0]
                
                let (avatarData, _) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
                let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/maxresdefault.jpg")!)
                
                let entry = SimpleEntry(date: .now, configuration: configuration, video: lives[0], avatarData: avatarData, thumbnailData: thumbnailData)
                completion(entry)
            } catch {
                print(error)
            }
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            do {
                let lives = try await VideoFetchService.shared.getVideos(from: "https://holodex.net/api/v2/live?org=Hololive&status=live&type=stream")
                
                let firstVideo = lives[0]
                
                let (avatarData, _) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
                let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/maxresdefault.jpg")!)
                
                let entry = SimpleEntry(date: .now, configuration: configuration, video: lives[0], avatarData: avatarData, thumbnailData: thumbnailData)
                
                let entries: [SimpleEntry] = [entry]
                
                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            } catch {
                print(error)
            }
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let video: LiveVideo
    
    let avatarData: Data
    let thumbnailData: Data
}

struct holo_wtf_widgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.video.escapedTitle)
    }
}

struct LivePaneWidgetEntryView: View {
    var entry: Provider.Entry
    
    var body: some View {
        LiveWidgetView(live: entry.video, thumbnailData: entry.thumbnailData, avatarData: entry.avatarData)
        // Text(entry.video.title)
    }
}

@main
struct holo_wtf_widget: Widget {
    let kind: String = "holo_wtf_widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            LivePaneWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Currently Live")
        .description("Show who is currently live. ")
        .supportedFamilies([.systemLarge])
    }
}

struct holo_wtf_widget_Previews: PreviewProvider {
    static var previews: some View {
        let channel: Channel = .init(id: "sampleChannelId", name: "Cp6993wxpyDPHUpavwDFqgg", photo: nil, org: "Hololive")
        
        let video: LiveVideo = .init(id: "sampleId", title: "My Debut Stream!", topicId: "debut", startScheduled: Date(), startActual: Date(), liveViewers: 1000, channel: channel)
        
        LivePaneWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), video: video, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
