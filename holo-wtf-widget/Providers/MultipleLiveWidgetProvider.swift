//
//  MultipleLiveWidgetProvider.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-23.
//

import WidgetKit
import Intents

struct MultipleLiveWidgetEntry: VideoTimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    
    let videoLeft: LiveVideo?
    let thumbnailDataLeft: Data
    
    let videoRight: LiveVideo?
    let thumbnailDataRight: Data
    
    let status: WidgetDataStatus
}

struct MultipleLiveWidgetProvider: IntentTimelineProvider {
    typealias Entry = MultipleLiveWidgetEntry
    
    let url: String = "https://holodex.net/api/v2/live?org=Hololive&status=live&type=stream"
    
    func placeholder(in context: Context) -> MultipleLiveWidgetEntry {
        let channel: Channel = .init(id: "UCp6993wxpyDPHUpavwDFqgg", name: "Tokino Sora", photo: nil, org: "Hololive")
        
        let video: LiveVideo = .init(id: "NT6Pf28eCgQ", title: "My Debut Stream!", topicId: "debut", startScheduled: Date(), startActual: Date(), liveViewers: 1000, songs: nil, channel: channel)
        
        return MultipleLiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: video, thumbnailDataLeft: Data(), videoRight: video, thumbnailDataRight: Data(), status: .ok)
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            do {
                var lives = try await VideoFetchService.shared.getVideos(from: url)
                lives.sort(by: {$0.startActual ?? Date.distantFuture > $1.startActual ?? Date.distantFuture})
                
                if lives.isEmpty {
                    let entry = MultipleLiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .noVideo)
                    
                    completion(entry)
                } else if lives.count == 1 {
                    let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
                    
                    let entry = MultipleLiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: lives[0], thumbnailDataLeft: thumbnailData, videoRight: nil, thumbnailDataRight: Data(), status: .ok)
                    
                    completion(entry)
                } else {
                    let (thumbnailDataLeft, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
                    
                    let (thumbnailDataRight, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[1].id)/maxresdefault.jpg")!)
                    
                    let entry = MultipleLiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: lives[0], thumbnailDataLeft: thumbnailDataLeft, videoRight: lives[1], thumbnailDataRight: thumbnailDataRight, status: .ok)
                    
                    completion(entry)
                }
            } catch {
                let entry = MultipleLiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .network)
                
                completion(entry)
            }
        }
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            do {
                var lives = try await VideoFetchService.shared.getVideos(from: url)
                lives.sort(by: {$0.startActual ?? Date.distantFuture > $1.startActual ?? Date.distantFuture})
                
                if lives.isEmpty {
                    let entry = MultipleLiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .noVideo)
                    
                    let entries: [MultipleLiveWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                } else if lives.count == 1 {
                    let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
                    
                    let entry = MultipleLiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: lives[0], thumbnailDataLeft: thumbnailData, videoRight: nil, thumbnailDataRight: Data(), status: .ok)
                    
                    let entries: [MultipleLiveWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                } else {
                    let (thumbnailDataLeft, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
                    
                    let (thumbnailDataRight, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[1].id)/maxresdefault.jpg")!)
                    
                    let entry = MultipleLiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: lives[0], thumbnailDataLeft: thumbnailDataLeft, videoRight: lives[1], thumbnailDataRight: thumbnailDataRight, status: .ok)
                    
                    let entries: [MultipleLiveWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                }
            } catch {
                let entry = MultipleLiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .network)
                
                let entries: [MultipleLiveWidgetEntry] = [entry]
                
                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            }
        }
    }
}
