//
//  VideoViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

@MainActor
class HololiveVideoViewModel: VideoViewModel<HololiveLiveVideo, HololiveChannel> {
    let logger = Logger()
    
    func getVideo(url: String, completion: @escaping ([HololiveLiveVideo]) -> Void) async {
        self.dataStatus = .working
        
        do {
            let getResult: [HololiveLiveVideo] = try await getVideos(from: url)
            let getResultWithTwitter: [HololiveLiveVideo] = try await getTwitterForAll(videoList: getResult)
            
            completion(getResultWithTwitter)
            self.dataStatus = .success
        } catch {
            self.dataStatus = .fail
        }
    }

    
    func updatedWithTwitter(channel: HololiveChannel) async -> HololiveChannel {
        return HololiveChannel(id: channel.id, name: channel.name, photo: channel.photo, org: channel.org, twitter: try? await channel.getTwitterId())
    }
    
    func updatedWithTwitter(video: HololiveLiveVideo) async -> HololiveLiveVideo {
        return HololiveLiveVideo(id: video.id, title: video.title, topicId: video.topicId, startScheduled: video.startScheduled, startActual: video.startActual, liveViewers: video.liveViewers, mentions: video.mentions, songs: video.songs, channel: await self.updatedWithTwitter(channel: video.channel))
    }
    
    func getTwitterForAll(videoList: [HololiveLiveVideo]) async throws -> [HololiveLiveVideo] {
        try await withThrowingTaskGroup(of: HololiveLiveVideo.self) { group in
            videoList.forEach { video in
                group.addTask {
                    return await self.updatedWithTwitter(video: video)
                }
            }
            
            var newVideos: [HololiveLiveVideo] = []
            newVideos.reserveCapacity(videoList.count)
            
            for try await video in group {
                newVideos.append(video)
            }
            
            return newVideos
        }
    }
    
    func getSearchSuggestions() -> [SearchSuggestion] {
        let englishNames: [SearchSuggestion] = self.videoList.map { video in
            if let talentEnum = HololiveTalentEnum(rawValue: video.channel.id), let talent = hololiveTalentEnumToTalent[talentEnum] {
                // talent exists here
                return SearchSuggestion(searchText: talent.names[.en]!, category: .name)
            } else {
                return SearchSuggestion(searchText: video.channel.name, category: .name)
            }
        }
        
        let japaneseNames: [SearchSuggestion] = self.videoList.map { video in
            if let talentEnum = HololiveTalentEnum(rawValue: video.channel.id), let talent = hololiveTalentEnumToTalent[talentEnum] {
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
}
