//
//  Common.swift
//  holo-wtf
//
//
//

import Foundation

func getEntry(url: String, sort sortAlgorithm: (LiveVideo, LiveVideo) -> Bool, filter filterAlgorithm: (LiveVideo) -> Bool) async -> SingleVideoWidgetEntry {
    do {
        var lives = try await VideoFetchService.shared.getVideos(from: url)
        
        lives.sort(by: sortAlgorithm)
        lives = lives.filter(filterAlgorithm)
        
        if lives.isEmpty {
            let entry = SingleVideoWidgetEntry(date: .now, video: nil, status: .noVideo, avatarData: Data(), thumbnailData: Data())
            return entry
        }
        
        let firstVideo = lives[0]
        
        let (avatarData, _) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
        let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/maxresdefault.jpg")!)
        
        let entry = SingleVideoWidgetEntry(date: .now, video: lives[0], status: .ok, avatarData: avatarData, thumbnailData: thumbnailData)
        
        return entry
    } catch {
        return SingleVideoWidgetEntry(date: .now, video: nil, status: .network, avatarData: Data(), thumbnailData: Data())
    }
}

func getMultipleEntry(url: String, sort sortAlgorithm: (LiveVideo, LiveVideo) -> Bool, filter filterAlgorithm: (LiveVideo) -> Bool) async -> MultipleVideoWidgetEntry {
    do {
        var lives = try await VideoFetchService.shared.getVideos(from: url)
        lives.sort(by: sortAlgorithm)
        lives = lives.filter(filterAlgorithm)
        
        if lives.isEmpty {
            let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .noVideo)
            
            return entry
        } else if lives.count == 1 {
            let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
            
            let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: lives[0], thumbnailDataLeft: thumbnailData, videoRight: nil, thumbnailDataRight: Data(), status: .ok)
            
            return entry
        } else {
            let (thumbnailDataLeft, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[0].id)/maxresdefault.jpg")!)
            
            let (thumbnailDataRight, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(lives[1].id)/maxresdefault.jpg")!)
            
            let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: lives[0], thumbnailDataLeft: thumbnailDataLeft, videoRight: lives[1], thumbnailDataRight: thumbnailDataRight, status: .ok)
            
            return entry
        }
    } catch {
        let entry = MultipleVideoWidgetEntry(date: Date(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .network)
        
        return entry
    }
}
