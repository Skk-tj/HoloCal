//
//  UpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit
import Intents

typealias UpcomingWidgetEntry = SingleVideoWidgetEntry

struct UpcomingWidgetProvider: IntentTimelineProvider {    
    typealias Entry = UpcomingWidgetEntry
    
    func placeholder(in context: Context) -> UpcomingWidgetEntry {
        let channel: Channel = .init(id: "UCp6993wxpyDPHUpavwDFqgg", name: "Tokino Sora", photo: nil, org: "Hololive")
        
        let video: LiveVideo = .init(id: "NT6Pf28eCgQ", title: "My Debut Stream!", topicId: "debut", startScheduled: Date(), startActual: Date(), liveViewers: 1000, songs: nil, channel: channel)
        
        return UpcomingWidgetEntry(date: Date(), configuration: ConfigurationIntent(), video: video, status: .ok, avatarData: Data(), thumbnailData: Data())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (UpcomingWidgetEntry) -> Void) {
        Task {
            do {
                var lives = try await VideoFetchService.shared.getVideos(from: "https://holodex.net/api/v2/live?org=Hololive&status=upcoming&type=stream")
                
                lives.sort(by: {$0.startActual ?? Date.distantFuture < $1.startActual ?? Date.distantFuture})
                
                let firstVideo = lives[0]
                
                let (avatarData, _) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
                let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/maxresdefault.jpg")!)
                
                let entry = UpcomingWidgetEntry(date: .now, configuration: configuration, video: lives[0], status: .ok, avatarData: avatarData, thumbnailData: thumbnailData)
                completion(entry)
            } catch {
                let entry = UpcomingWidgetEntry(date: .now, configuration: configuration, video: nil, status: .network, avatarData: Data(), thumbnailData: Data())
                
                completion(entry)
            }
        }
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<UpcomingWidgetEntry>) -> Void) {
        Task {
            do {
                var lives = try await VideoFetchService.shared.getVideos(from: "https://holodex.net/api/v2/live?org=Hololive&status=upcoming&type=stream")
                
                lives.sort(by: {$0.startActual ?? Date.distantFuture < $1.startActual ?? Date.distantFuture})
                
                if lives.isEmpty {
                    let entry = UpcomingWidgetEntry(date: .now, configuration: configuration, video: nil, status: .noVideo, avatarData: Data(), thumbnailData: Data())
                    
                    let entries: [UpcomingWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                } else {
                    let firstVideo = lives[0]
                    
                    let (avatarData, _) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
                    let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/maxresdefault.jpg")!)
                    
                    let entry = UpcomingWidgetEntry(date: .now, configuration: configuration, video: lives[0], status: .ok, avatarData: avatarData, thumbnailData: thumbnailData)
                    
                    let entries: [UpcomingWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                }
            } catch {
                let entry = UpcomingWidgetEntry(date: .now, configuration: configuration, video: nil, status: .network, avatarData: Data(), thumbnailData: Data())
                
                let entries: [UpcomingWidgetEntry] = [entry]
                
                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            }
        }
    }
}
