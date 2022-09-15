//
//  MultipleUpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit
import Intents

struct MultipleUpcomingWidgetProvider: TimelineProvider {
    typealias Entry = MultipleVideoWidgetEntry
    
    let url: String = "https://holodex.net/api/v2/live?org=Hololive&status=upcoming&type=stream"
    
    func placeholder(in context: Context) -> Entry {
        let channel: Channel = .init(id: "UCp6993wxpyDPHUpavwDFqgg", name: "Tokino Sora", photo: nil, org: "Hololive")
        
        let video: LiveVideo = .init(id: "NT6Pf28eCgQ", title: "My Debut Stream!", topicId: "debut", startScheduled: Date(), startActual: Date(), liveViewers: 1000, mentions: nil, songs: nil, channel: channel)
        
        return MultipleVideoWidgetEntry(date: Date(), videoLeft: video, thumbnailDataLeft: Data(), videoRight: video, thumbnailDataRight: Data(), status: .ok)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            do {
                var lives = try await VideoFetchService.shared.getVideos(from: url)
                lives.sort(by: {$0.startActual ?? Date.distantFuture < $1.startActual ?? Date.distantFuture})
                lives = lives.filter { video in
                    video.channel.org == "Hololive"
                }
                
                if lives.isEmpty {
                    let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .noVideo)
                    
                    completion(entry)
                } else if lives.count == 1 {
                    let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
                    
                    let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: lives[0], thumbnailDataLeft: thumbnailData, videoRight: nil, thumbnailDataRight: Data(), status: .ok)
                    
                    completion(entry)
                } else {
                    let (thumbnailDataLeft, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
                    
                    let (thumbnailDataRight, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[1].id)/maxresdefault.jpg")!)
                    
                    let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: lives[0], thumbnailDataLeft: thumbnailDataLeft, videoRight: lives[1], thumbnailDataRight: thumbnailDataRight, status: .ok)
                    
                    completion(entry)
                }
            } catch {
                let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .network)
                
                completion(entry)
            }
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            do {
                var lives = try await VideoFetchService.shared.getVideos(from: url)
                lives.sort(by: {$0.startActual ?? Date.distantFuture < $1.startActual ?? Date.distantFuture})
                lives = lives.filter { video in
                    video.channel.org == "Hololive"
                }
                
                if lives.isEmpty {
                    let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .noVideo)
                    
                    let entries: [MultipleVideoWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                } else if lives.count == 1 {
                    let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
                    
                    let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: lives[0], thumbnailDataLeft: thumbnailData, videoRight: nil, thumbnailDataRight: Data(), status: .ok)
                    
                    let entries: [MultipleVideoWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                } else {
                    let (thumbnailDataLeft, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
                    
                    let (thumbnailDataRight, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[1].id)/maxresdefault.jpg")!)
                    
                    let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: lives[0], thumbnailDataLeft: thumbnailDataLeft, videoRight: lives[1], thumbnailDataRight: thumbnailDataRight, status: .ok)
                    
                    let entries: [MultipleVideoWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                }
            } catch {
                let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .network)
                
                let entries: [MultipleVideoWidgetEntry] = [entry]
                
                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            }
        }
    }
}
