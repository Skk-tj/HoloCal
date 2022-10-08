//
//  Common.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-10-05.
//

import Foundation

func getEntry(url: String, sortBy sortAlgorithm: (LiveVideo, LiveVideo) -> Bool, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> SingleVideoWidgetEntry {
    do {
        var lives = try await VideoFetchService.shared.getVideos(from: url)
        lives = lives.filter(filterAlgorithm)
        lives.sort(by: sortAlgorithm)
        
        if lives.isEmpty {
            let entry = SingleVideoWidgetEntry(date: .now, status: .noVideo, video: nil, avatarData: Data(), thumbnailData: Data())
            return entry
        }
        
        let firstVideo = lives[0]
        
        let (avatarData, _) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
        let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/maxresdefault.jpg")!)
        
        let entry = SingleVideoWidgetEntry(date: .now, status: .ok, video: lives[0], avatarData: avatarData, thumbnailData: thumbnailData)
        
        return entry
    } catch {
        return SingleVideoWidgetEntry(date: .now, status: .network, video: nil, avatarData: Data(), thumbnailData: Data())
    }
}

func getMultipleEntry(url: String, sortBy sortAlgorithm: (LiveVideo, LiveVideo) -> Bool, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> MultipleVideoWidgetEntry {
    do {
        var lives = try await VideoFetchService.shared.getVideos(from: url)
        lives = lives.filter(filterAlgorithm)
        lives.sort(by: sortAlgorithm)
        
        if lives.isEmpty {
            let entry = MultipleVideoWidgetEntry(date: .now, status: .noVideo, videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data())
            
            return entry
        } else if lives.count == 1 {
            let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
            
            let entry = MultipleVideoWidgetEntry(date: .now, status: .ok, videoLeft: lives[0], thumbnailDataLeft: thumbnailData, videoRight: nil, thumbnailDataRight: Data())
            
            return entry
        } else {
            let (thumbnailDataLeft, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
            
            let (thumbnailDataRight, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[1].id)/maxresdefault.jpg")!)
            
            let entry = MultipleVideoWidgetEntry(date: .now, status: .ok, videoLeft: lives[0], thumbnailDataLeft: thumbnailDataLeft, videoRight: lives[1], thumbnailDataRight: thumbnailDataRight)
            
            return entry
        }
    } catch {
        let entry = MultipleVideoWidgetEntry(date: .now, status: .network, videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data())
        
        return entry
    }
}

func getChannelsEntry(from url: String, sortBy sortAlgorithm: (LiveVideo, LiveVideo) -> Bool, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> ChannelsEntry {
    do {
        var lives = try await VideoFetchService.shared.getVideos(from: url)
        lives.sort(by: sortAlgorithm)
        lives = lives.filter(filterAlgorithm)
        
        if lives.isEmpty {
            let entry = ChannelsEntry(date: .now, status: .noVideo, channels: [], thumbnails: [])
            return entry
        }
        
        let channels = lives.map { $0.channel }
        
        return ChannelsEntry(date: .now, status: .ok, channels: channels, thumbnails: try await getThumbnailsForChannels(channels))
    } catch {
        return ChannelsEntry(date: .now, status: .network, channels: [], thumbnails: [])
    }
}

func getThumbnailsForChannels(_ channels: [Channel]) async throws -> [Data] {
    try await withThrowingTaskGroup(of: Data.self) { group in
        channels.forEach { channel in
            group.addTask {
                let (thumbnail, _) = try await URLSession.shared.data(from: channel.photo!)
                
                return thumbnail
            }
        }
        
        var thumbnails: [Data] = []
        thumbnails.reserveCapacity(channels.count)
        
        for try await thumbnail in group {
            thumbnails.append(thumbnail)
        }
        
        return thumbnails
    }
}
