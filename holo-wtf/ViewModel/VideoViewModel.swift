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
}

enum SearchSuggestionCategory {
    case name
    case tag
}

struct SearchSuggestion: Hashable {
    let searchText: String
    let category: SearchSuggestionCategory
}

protocol VideoGettable {
    @MainActor
    func getVideoForUI() async
}

class VideoViewModel: ObservableObject {
    @Published var videoList: [LiveVideo]
    @Published var dataStatus: DataStatus
    @Published var sortingStrategy: SortingStrategy
    
    let agency: AgencyEnum
    
    init(for agency: AgencyEnum) {
        self.videoList = []
        self.dataStatus = .working
        self.agency = agency
        self.sortingStrategy = .notSorting
    }
    
    let logger = Logger()
    
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
        let favourites = getFavouritesFromUserDefaults(groupName: groupName)
        self.dataStatus = .working
        
        do {
            var getResult: [LiveVideo] = []
            
            for url in urls {
                async let videos = getVideos(from: url)
                getResult.append(contentsOf: (try? await videos) ?? [])
            }
            
            getResult = getResult.filter {
                favourites.contains($0.channel.id)
            }
            
            let getResultWithTwitter: [LiveVideo] = try await getTwitterForAll(videoList: getResult)
            
            completion(getResultWithTwitter)
            
            self.dataStatus = .success
        } catch {
            self.dataStatus = .fail
        }
    }
    
    func updatedWithTwitter(channel: Channel) async -> Channel {
        return Channel(id: channel.id, name: channel.name, photo: channel.photo, org: channel.org, twitter: try? await channel.getTwitterId())
    }
    
    func updatedWithTwitter(video: LiveVideo) async -> LiveVideo {
        return LiveVideo(id: video.id, title: video.title, topicId: video.topicId, startScheduled: video.startScheduled, startActual: video.startActual, liveViewers: video.liveViewers, mentions: video.mentions, duration: video.duration, songs: video.songs, channel: await self.updatedWithTwitter(channel: video.channel))
    }
    
    @MainActor
    func getTwitterForAll(videoList: [LiveVideo]) async throws -> [LiveVideo] {
        try await withThrowingTaskGroup(of: LiveVideo.self) { group in
            videoList.forEach { video in
                group.addTask {
                    return await self.updatedWithTwitter(video: video)
                }
            }
            
            var newVideos: [LiveVideo] = []
            newVideos.reserveCapacity(videoList.count)
            
            for try await video in group {
                newVideos.append(video)
            }
            
            return newVideos
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
            self.videoList.sort(by: {$0.liveViewers < $1.liveViewers})
        case .viewersDesc:
            self.videoList.sort(by: {$0.liveViewers > $1.liveViewers})
        case .timeAsc:
            self.videoList.sort(by: upcomingSortStrategy)
        case .timeDesc:
            self.videoList.sort(by: liveSortStrategy)
        default:
            return
        }
    }
}
