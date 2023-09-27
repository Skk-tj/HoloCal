//
//  Common.swift
//  holo-wtf
//
//
//

import Foundation
import UIKit

func getVideoURLForWidget(agency: IntentAgency, videoType: VideoType) -> String {
    switch agency {
    case .unknown, .favourites:
        switch videoType {
        case .live:
            return allLiveURL
        case .upcoming:
            return allWidgetUpcomingURL
        case .past:
            return allPastURL
        }
    default:
        switch videoType {
        case .live:
            return getLiveUrl(for: intentAgencyToAgency[agency]!)
        case .upcoming:
            return getWidgetUpcomingUrl(for: intentAgencyToAgency[agency]!)
        case .past:
            return getPastUrl(for: intentAgencyToAgency[agency]!)
        }
    }
}

func getVideosForWidget(agency: IntentAgency, videoType: VideoType) async throws -> [LiveVideo] {
    let favourites = getFavouritesFromUserDefaults(groupName: "group.io.skk-tj.holo-wtf.ios")
    
    switch agency {
    case .unknown:
        return try await getVideosFromAllAgencies(videoType: videoType)
    case .favourites:
        return try await getVideosFromAllAgencies(videoType: videoType).filter { favourites.contains($0.channel.id) }
    default:
        return try await getVideos(from: getVideoURLForWidget(agency: agency, videoType: videoType))
    }
}

func getVideosFromAllAgencies(videoType: VideoType) async throws -> [LiveVideo] {
    let getResult: [LiveVideo] = try await withThrowingTaskGroup(of: [LiveVideo].self) { group in
        for agency in AgencyEnum.allCases {
            group.addTask {
                switch videoType {
                case .live:
                    return try await getVideos(from: getLiveUrl(for: agency))
                case .upcoming:
                    return try await getVideos(from: getUpcomingUrl(for: agency))
                case .past:
                    return try await getVideos(from: getPastUrl(for: agency))
                }
            }
        }
        
        return try await group.reduce(into: [LiveVideo]()) { partialResult, videos in
            partialResult.append(contentsOf: videos)
        }
    }
    
    return getResult
}

func getAndFilterAndSortVideosCommon(for agency: IntentAgency, videoType: VideoType, sortBy: IntentSortBy, filterBy filterAlgorithm: (LiveVideo) -> Bool) async throws -> [LiveVideo] {
    var lives: [LiveVideo] = try await getVideosForWidget(agency: agency, videoType: videoType)
    
    lives = lives.filter(filterAlgorithm)
    
    switch sortBy {
    case .unknown, .mostRecent:
        switch videoType {
        case .live:
            lives.sort(by: liveSortStrategy)
        case .upcoming:
            lives.sort(by: upcomingSortStrategy)
        case .past:
            lives.sort(by: pastSortStrategy)
        }
    case .mostViewer:
        lives.sort(by: { $0.liveViewers ?? 0 > $1.liveViewers ?? 0 })
    }
    
    return lives
}

func getEntryWithIntent(for agency: IntentAgency, videoType: VideoType, sortBy: IntentSortBy, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> SingleVideoWidgetEntry {
    do {
        let lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: sortBy, filterBy: filterAlgorithm)
        
        if lives.isEmpty {
            let entry = SingleVideoWidgetEntry(date: .now, status: .noVideo, video: nil, avatarData: Data(), thumbnailData: Data(), agency: intentAgencyToDeepLinkAgency[agency]!)
            return entry
        }
        
        let firstVideo = lives[0]
        
        async let (avatarData, _) = URLSession.shared.data(from: firstVideo.channel.photo!)
        async let (thumbnailData, _) = URLSession.shared.data(from: firstVideo.thumbnailURL!)
        
        let entry = try await SingleVideoWidgetEntry(date: .now, status: .ok, video: lives[0], avatarData: avatarData, thumbnailData: thumbnailData, agency: intentAgencyToDeepLinkAgency[agency]!)
        
        return entry
    } catch {
        return SingleVideoWidgetEntry(date: .now, status: .network, video: nil, avatarData: Data(), thumbnailData: Data(), agency: intentAgencyToDeepLinkAgency[agency]!)
    }
}

enum MultipleVideoImageGetMethod {
    case thumbnail
    case avatar
}

// swiftlint:disable function_parameter_count
func getMultipleEntry(for agency: IntentAgency, videoType: VideoType, sortBy: IntentSortBy, filterBy filterAlgorithm: (LiveVideo) -> Bool, prefix: Int, imageGet: MultipleVideoImageGetMethod) async -> MultipleVideoWidgetEntry {
    do {
        var lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: sortBy, filterBy: filterAlgorithm)
        
        if lives.isEmpty {
            let entry = MultipleVideoWidgetEntry(date: .now, status: .noVideo, videos: [], images: [], agency: intentAgencyToDeepLinkAgency[agency]!)
            
            return entry
        }
        
        lives = lives.uniqued(on: { $0.id })
        lives = Array(lives.prefix(prefix))
        
        let grouped: [(video: LiveVideo, image: Data)]
        
        switch imageGet {
        case .thumbnail:
            grouped = try await getThumbnailsForVideos(lives)
        case .avatar:
            grouped = try await getAvatarsForVideos(lives)
        }
        
        let entry = MultipleVideoWidgetEntry(date: .now, status: .ok, videos: grouped.map { $0.video }, images: grouped.map { $0.image }, agency: intentAgencyToDeepLinkAgency[agency]!)
        
        return entry
    } catch {
        let entry = MultipleVideoWidgetEntry(date: .now, status: .network, videos: [], images: [], agency: intentAgencyToDeepLinkAgency[agency]!)
        
        return entry
    }
}
// swiftlint:enable function_parameter_count

func getCountEntry(for agency: IntentAgency, videoType: VideoType, filterBy filterPredicate: (LiveVideo) -> Bool) async -> VideoCountEntry {
    do {
        let lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: .mostRecent, filterBy: filterPredicate)
        return VideoCountEntry(date: .now, status: .ok, count: lives.count, agency: intentAgencyToDeepLinkAgency[agency]!)
    } catch {
        return VideoCountEntry(date: .now, status: .network, count: 0, agency: intentAgencyToDeepLinkAgency[agency]!)
    }
}

func getChannelsEntry(for agency: IntentAgency, videoType: VideoType, sortBy: IntentSortBy, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> ChannelsEntry {
    do {
        let lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: sortBy, filterBy: filterAlgorithm)
        
        if lives.isEmpty {
            let entry = ChannelsEntry(date: .now, status: .noVideo, channels: [], thumbnails: [], agency: intentAgencyToDeepLinkAgency[agency]!)
            return entry
        }
        
        let channels = Array(lives.map { $0.channel }.prefix(4))
        
        return ChannelsEntry(date: .now, status: .ok, channels: channels, thumbnails: try await getAvatarsForChannels(channels), agency: intentAgencyToDeepLinkAgency[agency]!)
    } catch {
        return ChannelsEntry(date: .now, status: .network, channels: [], thumbnails: [], agency: intentAgencyToDeepLinkAgency[agency]!)
    }
}

func getAvatarsForChannels(_ channels: [Channel]) async throws -> [Data] {
    try await withThrowingTaskGroup(of: Data.self) { group in
        channels.forEach { channel in
            group.addTask {
                let (avatar, _) = try await URLSession.shared.data(from: channel.photo!)
                return avatar
            }
        }
        
        return try await group.reduce(into: [Data]()) { partialResult, data in
            partialResult.append(data)
        }
    }
}

func getAvatarsForVideos(_ videos: [LiveVideo]) async throws -> [(video: LiveVideo, image: Data)] {
    try await withThrowingTaskGroup(of: (video: LiveVideo, image: Data).self) { group in
        videos.forEach { video in
            group.addTask {
                let (avatar, _) = try await URLSession.shared.data(from: video.channel.photo!)
                return (video, avatar)
            }
        }
        
        return try await group.reduce(into: [(video: LiveVideo, image: Data)]()) { partialResult, data in
            partialResult.append(data)
        }
    }
}

func getThumbnailsForVideos(_ videos: [LiveVideo]) async throws -> [(video: LiveVideo, image: Data)] {
    try await withThrowingTaskGroup(of: (video: LiveVideo, image: Data).self) { group in
        videos.forEach { video in
            group.addTask {
                let (thumbnail, _) = try await URLSession.shared.data(from: video.thumbnailURL!)
                return (video, thumbnail)
            }
        }
        
        return try await group.reduce(into: [(video: LiveVideo, image: Data)]()) { partialResult, data in
            partialResult.append(data)
        }
    }
}

func getAvatarsAndThumbnailsForVideos(_ videos: [LiveVideo]) async throws -> [(video: LiveVideo, avatar: Data, thumbnail: Data)] {
    try await withThrowingTaskGroup(of: (video: LiveVideo, avatar: Data, thumbnail: Data).self) { group in
        videos.forEach { video in
            group.addTask {
                async let (avatar, _) = URLSession.shared.data(from: video.channel.photo!)
                async let (thumbnail, _) = URLSession.shared.data(from: video.thumbnailURL!)
                return try await (video, avatar, thumbnail)
            }
        }
        
        return try await group.reduce(into: [(video: LiveVideo, avatar: Data, thumbnail: Data)]()) { partialResult, data in
            partialResult.append(data)
        }
    }
}
