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

@MainActor
class VideoViewModel: ObservableObject {
    @Published var videoList: [LiveVideo]
    @Published var dataStatus: DataStatus
    
    init() {
        self.videoList = []
        self.dataStatus = .working
    }
    
    let logger = Logger()
    
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
    
    
    func updatedWithTwitter(channel: Channel) async -> Channel {
        return Channel(id: channel.id, name: channel.name, photo: channel.photo, org: channel.org, twitter: try? await channel.getTwitterId())
    }
    
    func updatedWithTwitter(video: LiveVideo) async -> LiveVideo {
        return LiveVideo(id: video.id, title: video.title, topicId: video.topicId, startScheduled: video.startScheduled, startActual: video.startActual, liveViewers: video.liveViewers, mentions: video.mentions, songs: video.songs, channel: await self.updatedWithTwitter(channel: video.channel))
    }
    
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
    
    func sortVideos(by strategy: SortingStrategy) {
        switch strategy {
        case .viewersAsc:
            self.videoList.sort(by: {$0.liveViewers < $1.liveViewers})
        case .viewersDesc:
            self.videoList.sort(by: {$0.liveViewers > $1.liveViewers})
        case .timeAsc:
            self.videoList.sort(by: {$0.startActual ?? ($0.startScheduled ?? Date.distantFuture) < $1.startActual ?? ($1.startScheduled ?? Date.distantFuture)})
        case .timeDesc:
            self.videoList.sort(by: {$0.startActual ?? ($0.startScheduled ?? Date.distantFuture) > $1.startActual ?? ($1.startScheduled ?? Date.distantFuture)})
        default:
            return
        }
    }
}
