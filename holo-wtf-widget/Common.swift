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
    .hololive: [.en: "Hololive", .ja: "ホロライブ"],
    .nijisanji: [.en: "Nijisanji", .ja: "にじさんじ"],
    .react: [.en: "Re:AcT", .ja: "Re:AcT"]
]

let intentSortByToString: [IntentSortBy: [NameLanguage: String]] = [
    .mostViewer: [.en: "Most Viewer", .ja: "視聴者数順"],
    .mostRecent: [.en: "Most Recent", .ja: "開始時間順"]
]

let intentVideoTypeToString: [VideoType: [NameLanguage: String]] = [
    .live: [.en: "Live", .ja: "配信中"],
    .upcoming: [.en: "Upcoming", .ja: "今後の配信"]
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
    case .favourites:
        switch videoType {
        case .live:
            return allLiveURL
        case .upcoming:
            return allWidgetUpcomingURL
        }
    case .react:
        switch videoType {
        case .live:
            return reactLiveURL
        case .upcoming:
            return reactUpcomingURL
        }
    }
}

func getVideosForWidget(agency: IntentAgency, videoType: VideoType) async throws -> [LiveVideo] {
    switch agency {
    case .hololive:
        switch videoType {
        case .live:
            return try await getVideos(from: hololiveLiveURL)
        case .upcoming:
            return try await getVideos(from: hololiveWidgetUpcomingURL)
        }
    case .nijisanji:
        switch videoType {
        case .live:
            return try await getVideos(from: nijisanjiLiveURL)
        case .upcoming:
            return try await getVideos(from: nijisanjiWidgetUpcomingURL)
        }
    case .react:
        switch videoType {
        case .live:
            return try await getVideos(from: reactLiveURL)
        case .upcoming:
            return try await getVideos(from: reactWidgetUpcomingURL)
        }
    case .unknown:
        switch videoType {
        case .live:
            return try await getVideos(from: allLiveURL)
        case .upcoming:
            return try await getVideos(from: allWidgetUpcomingURL)
        }
    case .favourites:
        switch videoType {
        case .live:
            let favourites = getFavouritesFromUserDefaults(groupName: "group.io.skk-tj.holo-wtf.ios")
            
            var getResult: [LiveVideo] = []
            
            async let hololiveLive = getVideos(from: hololiveLiveURL)
            async let nijisanjiLive = getVideos(from: nijisanjiLiveURL)
            async let reactLive = getVideos(from: reactLiveURL)
            
            getResult.append(contentsOf: (try? await hololiveLive) ?? [])
            getResult.append(contentsOf: (try? await nijisanjiLive) ?? [])
            getResult.append(contentsOf: (try? await reactLive) ?? [])
            
            getResult = getResult.filter {
                favourites.contains($0.channel.id)
            }
            
            return getResult
        case .upcoming:
            let favourites = getFavouritesFromUserDefaults(groupName: "group.io.skk-tj.holo-wtf.ios")
            
            var getResult: [LiveVideo] = []
            
            async let hololiveLive = getVideos(from: hololiveWidgetUpcomingURL)
            async let nijisanjiLive = getVideos(from: nijisanjiWidgetUpcomingURL)
            async let reactLive = getVideos(from: reactWidgetUpcomingURL)
            
            getResult.append(contentsOf: (try? await hololiveLive) ?? [])
            getResult.append(contentsOf: (try? await nijisanjiLive) ?? [])
            getResult.append(contentsOf: (try? await reactLive) ?? [])
            
            getResult = getResult.filter {
                favourites.contains($0.channel.id)
            }
            
            return getResult
        }
    }
}

extension UIImage {
    func resizeWithUIKit(to newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, true, 1.0)
        self.draw(in: CGRect(origin: .zero, size: newSize))
        defer { UIGraphicsEndImageContext() }
        return UIGraphicsGetImageFromCurrentImageContext()
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
        
        let (avatarData, avatarResponse) = try await URLSession.shared.data(from: firstVideo.channel.photo!)
        
        guard let response = avatarResponse as? HTTPURLResponse, response.statusCode == 200 else {
            return SingleVideoWidgetEntry(date: .now, status: .network, video: nil, avatarData: Data(), thumbnailData: Data())
        }
        
        let (thumbnailData, _) = try await URLSession.shared.data(from: URL(string: "https://i.ytimg.com/vi/\(firstVideo.id)/maxresdefault.jpg")!)
        
        // MARK: - Resize image to 120x120
        // let newSize = CGSize(width: 120, height: 120)
        // let imageToBeResized: UIImage = UIImage(data: avatarData)!
        
        // let resizedImage = imageToBeResized.resizeWithUIKit(to: newSize)
        
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
