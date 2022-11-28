//
//  Common.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-10-05.
//

import Foundation

let intentAgencyToString: [IntentAgency: [NameLanguage: String]] = [
    .unknown: [.en: "All", .ja: "全部"],
    .hololive: [.en: "Hololive", .ja: "ホロライブ"],
    .nijisanji: [.en: "Nijisanji", .ja: "にじさんじ"]
]

let intentSortByToString: [IntentSortBy: [NameLanguage: String]] = [
    .mostViewer: [.en: "Most Viewer", .ja: "視聴者数順"],
    .mostRecent: [.en: "Most Recent", .ja: "開始時間順"]
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

func getVideoURLForWidget(agency: IntentAgency, videoType: VideoType) -> String {
    switch agency {
    case .hololive:
        switch videoType {
        case .live:
            return hololiveLiveURL
        case .upcoming:
            return hololiveWidgetUpcomingURL
        }
    case .nijisanji:
        switch videoType {
        case .live:
            return nijisanjiLiveURL
        case .upcoming:
            return nijisanjiWidgetUpcomingURL
        }
    case .unknown:
        switch videoType {
        case .live:
            return allLiveURL
        case .upcoming:
            return allWidgetUpcomingURL
        }
    }
}

func getAndFilterAndSortVideosCommon(for agency: IntentAgency, videoType: VideoType, sortBy: IntentSortBy, filterBy filterAlgorithm: (LiveVideo) -> Bool) async throws -> [LiveVideo] {
    var lives: [LiveVideo] = try await getVideos(from: getVideoURLForWidget(agency: agency, videoType: videoType))
    
    lives = lives.filter(filterAlgorithm)
    
    switch sortBy {
    case .unknown, .mostRecent:
        switch videoType {
        case .live:
            lives.sort(by: liveSortStrategy)
        case .upcoming:
            lives.sort(by: upcomingSortStrategy)
        }
    case .mostViewer:
        lives.sort(by: {$0.liveViewers > $1.liveViewers})
    }
    
    return lives
}

func getEntryWithIntent(for agency: IntentAgency, videoType: VideoType, sortBy: IntentSortBy, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> SingleVideoWidgetEntry {
    do {
        let lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: sortBy, filterBy: filterAlgorithm)
        
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

func getMultipleEntry(for agency: IntentAgency, videoType: VideoType, sortBy: IntentSortBy, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> MultipleVideoWidgetEntry {
    do {
        let lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: sortBy, filterBy: filterAlgorithm)
        
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

func getChannelsEntry(for agency: IntentAgency, videoType: VideoType, sortBy: IntentSortBy, filterBy filterAlgorithm: (LiveVideo) -> Bool) async -> ChannelsEntry {
    do {
        let lives = try await getAndFilterAndSortVideosCommon(for: agency, videoType: videoType, sortBy: sortBy, filterBy: filterAlgorithm)
        
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
