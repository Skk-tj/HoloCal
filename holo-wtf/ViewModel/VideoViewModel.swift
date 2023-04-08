//
//  VideoViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import Algorithms
import OSLog

enum DataStatus {
    case working
    case success
    case fail
}

enum SortingStrategy: Hashable {
    case notSorting
    case viewersAsc
    case viewersDesc
    case timeAsc
    case timeDesc
    case endedFirst
    case endedLast
}

enum SearchSuggestionCategory {
    case name
    case tag
}

struct SearchSuggestion: Hashable {
    let searchText: String
    let category: SearchSuggestionCategory
}

class VideoViewModel: ObservableObject {
    @Published var videoList: [LiveVideo]
    @Published var dataStatus: DataStatus
    @Published var sortingStrategy: SortingStrategy
    
    let agency: AgencyEnum
    let videoUrl: String
    
    init(for agency: AgencyEnum, videoType: VideoType) {
        self.videoList = []
        self.dataStatus = .working
        self.agency = agency
        self.sortingStrategy = .notSorting
        
        switch videoType {
        case .live:
            self.videoUrl = getLiveUrl(for: agency)
        case .upcoming:
            self.videoUrl = getUpcomingUrl(for: agency)
        case .past:
            self.videoUrl = getPastUrl(for: agency)
        }
    }
    
    let logger = Logger()
    
    @MainActor
    func getVideoForUI() async {
        await getVideo(url: videoUrl) { responseResult in
            self.videoList = responseResult
            self.sortVideos()
            self.videoList = self.videoList.filter { $0.isSupportedAgency }
        }
    }
    
    @MainActor
    func getVideo(url: String, completion: @escaping ([LiveVideo]) -> Void) async {
        self.dataStatus = .working
        
        do {
            let getResult: [LiveVideo] = try await getVideos(from: url)
            let getResultWithTwitter: [LiveVideo] = try await getTwitterForAll(videoList: getResult)
            
            completion(getResultWithTwitter)
            self.dataStatus = .success
        } catch {
            self.dataStatus = .fail
        }
    }
    
    @MainActor
    func getVideosForFavourites(urls: [String], groupName: String?, completion: @escaping ([LiveVideo]) -> Void) async {
        self.dataStatus = .working
        
        do {
            let getResult = try await getVideosForFavourites(urls: urls, groupName: groupName)
            let getResultWithTwitter: [LiveVideo] = try await getTwitterForAll(videoList: getResult)
            
            completion(getResultWithTwitter)
            self.dataStatus = .success
        } catch {
            self.dataStatus = .fail
        }
    }
    
    private func getVideosForFavourites(urls: [String], groupName: String?) async throws -> [LiveVideo] {
        let favourites = getFavouritesFromUserDefaults(groupName: groupName)
        
        let result = try await withThrowingTaskGroup(of: [LiveVideo].self) { group in
            urls.forEach { url in
                group.addTask {
                    return try await getVideos(from: url)
                }
            }
            
            return try await group.reduce(into: [LiveVideo]()) { partialResult, videos in
                partialResult.append(contentsOf: videos)
            }
        }
        
        let filteredResult = result.filter { favourites.contains($0.channel.id) }.uniqued { $0.id }
        
        return filteredResult
    }
    
    private func updatedWithTwitter(channel: Channel) async -> Channel {
        return Channel(id: channel.id, name: channel.name, photo: channel.photo, org: channel.org, twitter: try? await channel.getTwitterId())
    }
    
    private func updatedWithTwitter(video: LiveVideo) async -> LiveVideo {
        return LiveVideo(id: video.id, title: video.title, topicId: video.topicId, startScheduled: video.startScheduled, startActual: video.startActual, availableAt: video.availableAt, publishedAt: video.publishedAt, liveViewers: video.liveViewers, mentions: video.mentions, duration: video.duration, songs: video.songs, channel: await self.updatedWithTwitter(channel: video.channel))
    }
    
    @MainActor
    func getTwitterForAll(videoList: [LiveVideo]) async throws -> [LiveVideo] {
        try await withThrowingTaskGroup(of: LiveVideo.self) { group in
            videoList.forEach { video in
                group.addTask {
                    return await self.updatedWithTwitter(video: video)
                }
            }
            
            return try await group.reduce(into: [LiveVideo]()) { partialResult, video in
                partialResult.append(video)
            }
        }
    }
    
    func getSearchSuggestions() -> [SearchSuggestion] {
        let englishNames: [SearchSuggestion] = self.videoList.map { video in
            if let talentEnum = TalentEnum(rawValue: video.channel.id), let talent = talentEnumToTalent[talentEnum] {
                // talent exists here
                return SearchSuggestion(searchText: talent.names[.en]!, category: .name)
            } else {
                return SearchSuggestion(searchText: video.channel.name, category: .name)
            }
        }
        
        let japaneseNames: [SearchSuggestion] = self.videoList.map { video in
            if let talentEnum = TalentEnum(rawValue: video.channel.id), let talent = talentEnumToTalent[talentEnum] {
                // talent exists here
                return SearchSuggestion(searchText: talent.names[.ja]!, category: .name)
            } else {
                return SearchSuggestion(searchText: video.channel.name, category: .name)
            }
        }
        let allTags: [String] = self.videoList.compactMap { video in video.topicId }
        let allTagsInStruct: [SearchSuggestion] = allTags.map { suggestion in SearchSuggestion(searchText: suggestion, category: .tag) }
        
        let suggestionsList: [SearchSuggestion] = Array((englishNames + japaneseNames + allTagsInStruct).uniqued())
        
        return suggestionsList
    }
    
    @MainActor
    func sortVideos() {
        switch self.sortingStrategy {
        case .viewersAsc:
            self.videoList.sort(by: { $0.liveViewers ?? 0 < $1.liveViewers ?? 0 })
        case .viewersDesc:
            self.videoList.sort(by: { $0.liveViewers ?? 0 > $1.liveViewers ?? 0 })
        case .timeAsc:
            self.videoList.sort(by: upcomingSortStrategy)
        case .timeDesc:
            self.videoList.sort(by: liveSortStrategy)
        case .endedFirst:
            self.videoList.sort(by: pastSortStrategy)
        case .endedLast:
            self.videoList.sort(by: pastSortStrategy)
            self.videoList = self.videoList.reversed()
        default:
            return
        }
    }
}
