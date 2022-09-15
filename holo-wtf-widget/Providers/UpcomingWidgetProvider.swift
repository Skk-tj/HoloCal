//
//  UpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit
import Intents

struct UpcomingWidgetProvider: TimelineProvider {    
    typealias Entry = SingleVideoWidgetEntry
    
    func placeholder(in context: Context) -> Entry {
        let channel: Channel = .init(id: "UCp6993wxpyDPHUpavwDFqgg", name: "Tokino Sora", photo: nil, org: "Hololive")
        
        let video: LiveVideo = .init(id: "NT6Pf28eCgQ", title: "My Debut Stream!", topicId: "debut", startScheduled: Date(), startActual: Date(), liveViewers: 1000, mentions: nil, songs: nil, channel: channel)
        
        return SingleVideoWidgetEntry(date: Date(), video: video, status: .ok, avatarData: Data(), thumbnailData: Data())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            do {
                var lives = try await VideoFetchService.shared.getVideos(from: "https://holodex.net/api/v2/live?org=Hololive&status=upcoming&type=stream")
                lives.sort(by: {$0.startActual ?? Date.distantFuture < $1.startActual ?? Date.distantFuture})
                lives = lives.filter { video in
                    video.channel.org == "Hololive"
                }
                
                let firstVideo = lives[0]
                
                let (avatarData, _) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
                let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/maxresdefault.jpg")!)
                
                let entry = SingleVideoWidgetEntry(date: .now, video: lives[0], status: .ok, avatarData: avatarData, thumbnailData: thumbnailData)
                completion(entry)
            } catch {
                let entry = SingleVideoWidgetEntry(date: .now, video: nil, status: .network, avatarData: Data(), thumbnailData: Data())
                
                completion(entry)
            }
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            do {
                var lives = try await VideoFetchService.shared.getVideos(from: "https://holodex.net/api/v2/live?org=Hololive&status=upcoming&type=stream")
                lives.sort(by: {$0.startActual ?? Date.distantFuture < $1.startActual ?? Date.distantFuture})
                lives = lives.filter { video in
                    video.channel.org == "Hololive"
                }
                
                if lives.isEmpty {
                    let entry = SingleVideoWidgetEntry(date: .now, video: nil, status: .noVideo, avatarData: Data(), thumbnailData: Data())
                    
                    let entries: [SingleVideoWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                } else {
                    let firstVideo = lives[0]
                    
                    let (avatarData, _) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
                    let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/maxresdefault.jpg")!)
                    
                    let entry = SingleVideoWidgetEntry(date: .now, video: lives[0], status: .ok, avatarData: avatarData, thumbnailData: thumbnailData)
                    
                    let entries: [SingleVideoWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                }
            } catch {
                let entry = SingleVideoWidgetEntry(date: .now, video: nil, status: .network, avatarData: Data(), thumbnailData: Data())
                
                let entries: [SingleVideoWidgetEntry] = [entry]
                
                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            }
        }
    }
}
