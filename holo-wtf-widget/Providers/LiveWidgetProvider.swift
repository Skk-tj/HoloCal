//
//  LiveWidgetProvider.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-22.
//

import WidgetKit
import Intents
import SwiftUI

typealias LiveWidgetEntry = SingleVideoWidgetEntry

struct LiveWidgetProvider: IntentTimelineProvider {
    typealias Entry = LiveWidgetEntry
    
    func placeholder(in context: Context) -> LiveWidgetEntry {
        let channel: Channel = .init(id: "UCp6993wxpyDPHUpavwDFqgg", name: "Tokino Sora", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLRo4fRoifdnGRyvGIOVxiumNdD5MXweEPHLO_SBrA=s800-c-k-c0x00ffffff-no-rj-mo"), org: "Hololive")
        
        let video: LiveVideo = .init(id: "NT6Pf28eCgQ", title: "My Debut Stream!", topicId: "debut", startScheduled: Date(), startActual: Date(), liveViewers: 1000, songs: nil, channel: channel)
        
        return LiveWidgetEntry(date: Date(), configuration: ConfigurationIntent(), video: video, status: .ok, avatarData: Data(), thumbnailData: Data())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (LiveWidgetEntry) -> ()) {
        Task {
            do {
                var lives = try await VideoFetchService.shared.getVideos(from: "https://holodex.net/api/v2/live?org=Hololive&status=live&type=stream")
                
                lives.sort(by: {$0.startActual ?? Date.distantFuture > $1.startActual ?? Date.distantFuture})
                
                if lives.isEmpty {
                    let entry = LiveWidgetEntry(date: .now, configuration: configuration, video: nil, status: .noVideo, avatarData: Data(), thumbnailData: Data())
                    completion(entry)
                    return
                }
                
                let firstVideo = lives[0]
                
                let (avatarData, _) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
                let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/maxresdefault.jpg")!)
                
                let entry = LiveWidgetEntry(date: .now, configuration: configuration, video: lives[0], status: .ok, avatarData: avatarData, thumbnailData: thumbnailData)
                completion(entry)
            } catch {
                let entry = LiveWidgetEntry(date: .now, configuration: configuration, video: nil, status: .network, avatarData: Data(), thumbnailData: Data())
                
                completion(entry)
            }
        }
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            do {
                var lives = try await VideoFetchService.shared.getVideos(from: "https://holodex.net/api/v2/live?org=Hololive&status=live&type=stream")
                
                lives.sort(by: {$0.startActual ?? Date.distantFuture > $1.startActual ?? Date.distantFuture})
                
                if lives.isEmpty {
                    let entry = LiveWidgetEntry(date: .now, configuration: configuration, video: nil, status: .noVideo, avatarData: Data(), thumbnailData: Data())
                    
                    let entries: [LiveWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                } else {
                    let firstVideo = lives[0]
                    
                    let (avatarData, _) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
                    let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/maxresdefault.jpg")!)
                    
                    let entry = LiveWidgetEntry(date: .now, configuration: configuration, video: lives[0], status: .ok, avatarData: avatarData, thumbnailData: thumbnailData)
                    
                    let entries: [LiveWidgetEntry] = [entry]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                }
            } catch {
                let entry = LiveWidgetEntry(date: .now, configuration: configuration, video: nil, status: .network, avatarData: Data(), thumbnailData: Data())
                
                let entries: [LiveWidgetEntry] = [entry]
                
                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            }
        }
    }
}
