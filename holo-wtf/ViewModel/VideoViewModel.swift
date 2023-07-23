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
    let videoType: VideoType
    
    var error: VideoFetchServiceError?
    
    init(for agency: AgencyEnum, videoType: VideoType) {
        self.videoList = []
        self.dataStatus = .working
        self.agency = agency
        self.sortingStrategy = .notSorting
        self.videoType = videoType
    }
    
    let logger = Logger()
    
    @MainActor
    func getVideoForUI() async {
        await getVideo { responseResult in
            self.videoList = responseResult
            self.sortVideos()
            self.videoList = self.videoList.filter { $0.isAgency(agency: self.agency) }
        }
    }
    
    @MainActor
    func getVideo(completion: @escaping ([LiveVideo]) -> Void) async {
        self.dataStatus = .working
        
        do {
            let getResult: [LiveVideo] = try await getVideos(for: videoType, agency: agency)
            let getResultWithTwitter: [LiveVideo] = await getTwitterForAll(videoList: getResult)
            
            completion(getResultWithTwitter)
            self.dataStatus = .success
        } catch VideoFetchServiceError.apiUrlError {
            self.dataStatus = .fail
            self.error = VideoFetchServiceError.apiUrlError
        } catch VideoFetchServiceError.other(let theError) {
            self.dataStatus = .fail
            self.error = VideoFetchServiceError.other(theError)
        } catch VideoFetchServiceError.network(let networkCode) {
            self.dataStatus = .fail
            self.error = VideoFetchServiceError.network(networkCode)
        } catch {
            self.dataStatus = .fail
        }
    }
    
    @MainActor
    func getVideosForFavourites(urls: [String], groupName: String?, completion: @escaping ([LiveVideo]) -> Void) async {
        self.dataStatus = .working
        
        do {
            let getResult = try await getVideosForFavourites(urls: urls, groupName: groupName)
            let getResultWithTwitter: [LiveVideo] = await getTwitterForAll(videoList: getResult)
            
            completion(getResultWithTwitter)
            self.dataStatus = .success
        } catch VideoFetchServiceError.apiUrlError {
            self.dataStatus = .fail
            self.error = VideoFetchServiceError.apiUrlError
        } catch VideoFetchServiceError.other(let theError) {
            self.dataStatus = .fail
            self.error = VideoFetchServiceError.other(theError)
        } catch VideoFetchServiceError.network(let networkCode) {
            self.dataStatus = .fail
            self.error = VideoFetchServiceError.network(networkCode)
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
        return Channel(id: channel.id, name: channel.name, photo: channel.photo, org: channel.org, twitter: try? await getTwitterId(for: channel))
    }
    
    private func updatedWithTwitter(video: LiveVideo) async -> LiveVideo {
        return LiveVideo(id: video.id, title: video.title, topicId: video.topicId, startScheduled: video.startScheduled, startActual: video.startActual, availableAt: video.availableAt, publishedAt: video.publishedAt, liveViewers: video.liveViewers, mentions: video.mentions, duration: video.duration, songs: video.songs, channel: await self.updatedWithTwitter(channel: video.channel))
    }
    
    @MainActor
    func getTwitterForAll(videoList: [LiveVideo]) async -> [LiveVideo] {
        await withTaskGroup(of: LiveVideo.self) { group in
            videoList.forEach { video in
                group.addTask {
                    return await self.updatedWithTwitter(video: video)
                }
            }
            
            return await group.reduce(into: [LiveVideo]()) { partialResult, video in
                partialResult.append(video)
            }
        }
    }
    
    func getSearchSuggestions() -> [SearchSuggestion] {
        let names: [SearchSuggestion] = self.videoList.map { video in
            if let talentEnum = TalentEnum(rawValue: video.channel.id), let talent = talentEnumToTalent[talentEnum] {
                let preferredSearchLanguage = NameLanguage(rawValue: UserDefaults.standard.integer(forKey: UserDefaultKeys.searchSuggestionLanguage)) ?? .en
                return SearchSuggestion(searchText: talent.names[preferredSearchLanguage]!, category: .name)
            } else {
                return SearchSuggestion(searchText: video.channel.name, category: .name)
            }
        }
        
        let allTags: [String] = self.videoList.compactMap { video in video.topicId }
        let allTagsInStruct: [SearchSuggestion] = allTags.map { suggestion in SearchSuggestion(searchText: suggestion, category: .tag) }
        
        let suggestionsList: [SearchSuggestion] = Array((names + allTagsInStruct).uniqued())
        
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
        case .notSorting:
            return
        }
    }
}
