//
//  Common.swift
//  holo-wtf
//
//
//

import Foundation
import UIKit

let intentAgencyToString: [IntentAgency: [NameLanguage: String]] = [
    .unknown: [.en: "All", .ja: "全部"],
    .hololive: intentAgencyToAgency[IntentAgency.hololive]!.getAgency().names,
    .nijisanji: intentAgencyToAgency[IntentAgency.nijisanji]!.getAgency().names,
    .react: intentAgencyToAgency[IntentAgency.react]!.getAgency().names,
    .nanashiInc: intentAgencyToAgency[IntentAgency.nanashiInc]!.getAgency().names,
    .noriPro: intentAgencyToAgency[IntentAgency.noriPro]!.getAgency().names,
]

let intentAgencyToAgency: [IntentAgency: AgencyEnum] = [
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .noriPro: .noriPro
]

let intentSortByToString: [IntentSortBy: [NameLanguage: String]] = [
    .mostViewer: [.en: "Most Viewer", .ja: "視聴者数順"],
    .mostRecent: [.en: "Most Recent", .ja: "開始時間順"]
]

let intentVideoTypeToString: [VideoType: [NameLanguage: String]] = [
    .live: [.en: "Live", .ja: "配信中"],
    .upcoming: [.en: "Upcoming", .ja: "今後の配信"],
    .past: [.en: "Past", .ja: "アーカイブ"]
]

extension IntentAgency {
    var localizedName: String {
        if let langCode = Locale.current.language.languageCode?.identifier {
            let lang: NameLanguage = langCode == "ja" ? .ja : .en
            return intentAgencyToString[self]![lang]!
        } else {
            return intentAgencyToString[self]![.en]!
        }
    }
    
    var altLocalizedName: String {
        if let langCode = Locale.current.language.languageCode?.identifier {
            let lang: NameLanguage = langCode == "ja" ? .en : .ja
            return intentAgencyToString[self]![lang]!
        } else {
            return intentAgencyToString[self]![.ja]!
        }
    }
}

extension IntentSortBy {
    var localizedName: String {
        if let langCode = Locale.current.language.languageCode?.identifier {
            let lang: NameLanguage = langCode == "ja" ? .ja : .en
            return intentSortByToString[self]![lang]!
        } else {
            return intentSortByToString[self]![.en]!
        }
    }
    
    var altLocalizedName: String {
        if let langCode = Locale.current.language.languageCode?.identifier {
            let lang: NameLanguage = langCode == "ja" ? .en : .ja
            return intentSortByToString[self]![lang]!
        } else {
            return intentSortByToString[self]![.ja]!
        }
    }
}

func getIntentVideoTypeLocalizedName(_ videoType: VideoType) -> String {
    if let langCode = Locale.current.language.languageCode?.identifier {
        let lang: NameLanguage = langCode == "ja" ? .ja : .en
        return intentVideoTypeToString[videoType]![lang]!
    } else {
        return intentVideoTypeToString[videoType]![.en]!
    }
}

func getIntentVideoTypeAltLocalizedName(_ videoType: VideoType) -> String {
    if let langCode = Locale.current.language.languageCode?.identifier {
        let lang: NameLanguage = langCode == "ja" ? .en : .ja
        return intentVideoTypeToString[videoType]![lang]!
    } else {
        return intentVideoTypeToString[videoType]![.ja]!
    }
}

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
    case .favourites:
        switch videoType {
        case .live:
            let getResult: [LiveVideo] = try await withThrowingTaskGroup(of: [LiveVideo].self) { group in
                var result: [LiveVideo] = []
                
                for agency in AgencyEnum.allCases {
                    group.addTask {
                        return try await getVideos(from: getLiveUrl(for: agency))
                    }
                }
                
                for try await videos in group {
                    result.append(contentsOf: videos)
                }
                
                return result
            }.filter { favourites.contains($0.channel.id) }
            
            return getResult
        case .upcoming:
            let getResult: [LiveVideo] = try await withThrowingTaskGroup(of: [LiveVideo].self) { group in
                var result: [LiveVideo] = []
                
                for agency in AgencyEnum.allCases {
                    group.addTask {
                        return try await getVideos(from: getWidgetUpcomingUrl(for: agency))
                    }
                }
                
                for try await videos in group {
                    result.append(contentsOf: videos)
                }
                
                return result
            }.filter { favourites.contains($0.channel.id) }
            
            return getResult
        case .past:
            let getResult: [LiveVideo] = try await withThrowingTaskGroup(of: [LiveVideo].self) { group in
                var result: [LiveVideo] = []
                
                for agency in AgencyEnum.allCases {
                    group.addTask {
                        return try await getVideos(from: getPastUrl(for: agency))
                    }
                }
                
                for try await videos in group {
                    result.append(contentsOf: videos)
                }
                
                return result
            }.filter { favourites.contains($0.channel.id) }
            
            return getResult
        }
    default:
        return try await getVideos(from: getVideoURLForWidget(agency: agency, videoType: videoType))
    }
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
        
        let (avatarData, avatarResponse) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
        
        guard let response = avatarResponse as? HTTPURLResponse, response.statusCode == 200 else {
            return SingleVideoWidgetEntry(date: .now, status: .network, video: nil, avatarData: Data(), thumbnailData: Data(), agency: intentAgencyToDeepLinkAgency[agency]!)
        }
        
        let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/hq720.jpg")!)
        
        let entry = SingleVideoWidgetEntry(date: .now, status: .ok, video: lives[0], avatarData: avatarData, thumbnailData: thumbnailData, agency: intentAgencyToDeepLinkAgency[agency]!)
        
        return entry
    } catch {
        return SingleVideoWidgetEntry(date: .now, status: .network, video: nil, avatarData: Data(), thumbnailData: Data(), agency: intentAgencyToDeepLinkAgency[agency]!)
    }
}

func getMultipleEntry(for agency: IntentAgency, videoType: VideoType, sortBy: IntentSortBy, videoCutOff: Int, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> MultipleVideoWidgetEntry {
    do {
        let lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: sortBy, filterBy: filterAlgorithm)
        
        if lives.isEmpty {
            let entry = MultipleVideoWidgetEntry(date: .now, status: .noVideo, videos: [], thumbnails: [], agency: intentAgencyToDeepLinkAgency[agency]!)
            
            return entry
        }
        
        let thumbnails = try await getThumbnailsForVideos(Array(lives.prefix(videoCutOff)))
        
        let entry = MultipleVideoWidgetEntry(date: .now, status: .ok, videos: lives.prefix(videoCutOff), thumbnails: thumbnails, agency: intentAgencyToDeepLinkAgency[agency]!)
        
        return entry
    } catch {
        let entry = MultipleVideoWidgetEntry(date: .now, status: .network, videos: [], thumbnails: [], agency: intentAgencyToDeepLinkAgency[agency]!)
        
        return entry
    }
}

func getChannelsEntry(for agency: IntentAgency, videoType: VideoType, sortBy: IntentSortBy, channelsCutOff: Int, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> ChannelsEntry {
    do {
        let lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: sortBy, filterBy: filterAlgorithm)
        
        if lives.isEmpty {
            let entry = ChannelsEntry(date: .now, status: .noVideo, channels: [], thumbnails: [], agency: intentAgencyToDeepLinkAgency[agency]!)
            return entry
        }
        
        let channels = lives.map { $0.channel }
        
        return ChannelsEntry(date: .now, status: .ok, channels: channels.prefix(4), thumbnails: try await getThumbnailsForChannels(channels), agency: intentAgencyToDeepLinkAgency[agency]!)
    } catch {
        return ChannelsEntry(date: .now, status: .network, channels: [], thumbnails: [], agency: intentAgencyToDeepLinkAgency[agency]!)
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

func getThumbnailsForVideos(_ videos: [LiveVideo]) async throws -> [Data] {
    try await withThrowingTaskGroup(of: Data.self) { group in
        videos.forEach { video in
            group.addTask {
                let (thumbnail, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(video.id)/hq720.jpg")!)
                
                return thumbnail
            }
        }
        
        var thumbnails: [Data] = []
        thumbnails.reserveCapacity(videos.count)
        
        for try await thumbnail in group {
            thumbnails.append(thumbnail)
        }
        
        return thumbnails
    }
}
