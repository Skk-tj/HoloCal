//
//  CommonAppIntent.swift
//  holo-wtf
//
//
//

import Foundation

func getVideoURLForWidget(agency: IntentAgencyAppEnum?, videoType: VideoType) -> String {
    if let agency {
        switch agency {
        case .favourites:
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
                return getLiveUrl(for: appIntentAgencyToAgency[agency]!)
            case .upcoming:
                return getWidgetUpcomingUrl(for: appIntentAgencyToAgency[agency]!)
            case .past:
                return getPastUrl(for: appIntentAgencyToAgency[agency]!)
            }
        }
    } else {
        switch videoType {
        case .live:
            return allLiveURL
        case .upcoming:
            return allWidgetUpcomingURL
        case .past:
            return allPastURL
        }
    }
}

func getVideosForWidget(agency: IntentAgencyAppEnum?, videoType: VideoType) async throws -> [LiveVideo] {
    let favourites = getFavouritesFromUserDefaults(groupName: "group.io.skk-tj.holo-wtf.ios")
    
    switch agency {
    case nil:
        return try await getVideosFromAllAgencies(videoType: videoType)
    case .favourites:
        return try await getVideosFromAllAgencies(videoType: videoType).filter { favourites.contains($0.channel.id) }
    default:
        return try await getVideos(from: getVideoURLForWidget(agency: agency, videoType: videoType))
    }
}

func getAndFilterAndSortVideosCommon(for agency: IntentAgencyAppEnum?, videoType: VideoType, sortBy: IntentSortByAppEnum?, filterBy filterAlgorithm: (LiveVideo) -> Bool) async throws -> [LiveVideo] {
    var lives: [LiveVideo] = try await getVideosForWidget(agency: agency, videoType: videoType)
    
    lives = lives.filter(filterAlgorithm)
    
    switch sortBy {
    case nil, .mostRecent:
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

func getEntryWithIntent(for agency: IntentAgencyAppEnum?, videoType: VideoType, sortBy: IntentSortByAppEnum?, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> AppIntentSingleVideoWidgetEntry {
    do {
        let lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: sortBy, filterBy: filterAlgorithm)
        
        if lives.isEmpty {
            let entry = AppIntentSingleVideoWidgetEntry(date: .now, status: .noVideo, video: nil, avatarData: Data(), thumbnailData: Data(), agency: agency)
            return entry
        }
        
        let firstVideo = lives[0]
        
        async let (avatarData, _) = URLSession.shared.data(from: firstVideo.channel.photo!)
        async let (thumbnailData, _) = URLSession.shared.data(from: firstVideo.thumbnailURL!)
        
        let entry = try await AppIntentSingleVideoWidgetEntry(date: .now, status: .ok, video: lives[0], avatarData: avatarData, thumbnailData: thumbnailData, agency: agency)
        
        return entry
    } catch {
        return AppIntentSingleVideoWidgetEntry(date: .now, status: .network, video: nil, avatarData: Data(), thumbnailData: Data(), agency: agency)
    }
}

func getMultipleEntry(for agency: IntentAgencyAppEnum?, videoType: VideoType, sortBy: IntentSortByAppEnum?, filterBy filterAlgorithm: (LiveVideo) -> Bool, prefix: Int, imageGet: MultipleVideoImageGetMethod) async -> AppIntentMultipleVideoWidgetEntry {
    do {
        var lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: sortBy, filterBy: filterAlgorithm)
        
        if lives.isEmpty {
            let entry = AppIntentMultipleVideoWidgetEntry(date: .now, status: .noVideo, videos: [], images: [], agency: agency)
            
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
        
        let entry = AppIntentMultipleVideoWidgetEntry(date: .now, status: .ok, videos: grouped.map { $0.video }, images: grouped.map { $0.image }, agency: agency)
        
        return entry
    } catch {
        let entry = AppIntentMultipleVideoWidgetEntry(date: .now, status: .network, videos: [], images: [], agency: agency)
        
        return entry
    }
}

func getCountEntry(for agency: IntentAgencyAppEnum?, videoType: VideoType, filterBy filterPredicate: (LiveVideo) -> Bool) async -> AppIntentVideoCountEntry {
    do {
        let lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: .mostRecent, filterBy: filterPredicate)
        return AppIntentVideoCountEntry(date: .now, status: .ok, count: lives.count, agency: agency)
    } catch {
        return AppIntentVideoCountEntry(date: .now, status: .network, count: 0, agency: agency)
    }
}

func getChannelsEntry(for agency: IntentAgencyAppEnum?, videoType: VideoType, sortBy: IntentSortByAppEnum?, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> AppIntentChannelsEntry {
    do {
        let lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: sortBy, filterBy: filterAlgorithm)
        
        if lives.isEmpty {
            let entry = AppIntentChannelsEntry(date: .now, status: .noVideo, channels: [], thumbnails: [], agency: agency)
            return entry
        }
        
        let channels = Array(lives.map { $0.channel }.prefix(4))
        
        return AppIntentChannelsEntry(date: .now, status: .ok, channels: channels, thumbnails: try await getAvatarsForChannels(channels), agency: agency)
    } catch {
        return AppIntentChannelsEntry(date: .now, status: .network, channels: [], thumbnails: [], agency: agency)
    }
}
