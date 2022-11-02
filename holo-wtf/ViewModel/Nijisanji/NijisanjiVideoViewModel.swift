//
//  NijisanjiVideoViewModel.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-10-30.
//

import Foundation
import OSLog

@MainActor
class NijisanjiVideoViewModel: VideoViewModel<NijisanjiLiveVideo, NijisanjiChannel> {
    let logger = Logger()
    
    func getVideo(url: String, completion: @escaping ([NijisanjiLiveVideo]) -> Void) async {
        self.dataStatus = .working
        
        do {
            let getResult: [NijisanjiLiveVideo] = try await getVideos(from: url)
            let getResultWithTwitter: [NijisanjiLiveVideo] = try await getTwitterForAll(videoList: getResult)
            
            completion(getResultWithTwitter)
            self.dataStatus = .success
        } catch {
            self.dataStatus = .fail
        }
    }
    
    
    func updatedWithTwitter(channel: NijisanjiChannel) async -> NijisanjiChannel {
        return NijisanjiChannel(id: channel.id, name: channel.name, photo: channel.photo, org: channel.org, twitter: try? await channel.getTwitterId())
    }
    
    func updatedWithTwitter(video: NijisanjiLiveVideo) async -> NijisanjiLiveVideo {
        return NijisanjiLiveVideo(id: video.id, title: video.title, topicId: video.topicId, startScheduled: video.startScheduled, startActual: video.startActual, liveViewers: video.liveViewers, mentions: video.mentions, songs: video.songs, channel: await self.updatedWithTwitter(channel: video.channel))
    }
    
    func getTwitterForAll(videoList: [NijisanjiLiveVideo]) async throws -> [NijisanjiLiveVideo] {
        try await withThrowingTaskGroup(of: NijisanjiLiveVideo.self) { group in
            videoList.forEach { video in
                group.addTask {
                    return await self.updatedWithTwitter(video: video)
                }
            }
            
            var newVideos: [NijisanjiLiveVideo] = []
            newVideos.reserveCapacity(videoList.count)
            
            for try await video in group {
                newVideos.append(video)
            }
            
            return newVideos
        }
    }
    
    func getSearchSuggestions() -> [SearchSuggestion] {
        let englishNames: [SearchSuggestion] = self.videoList.map { video in
            if let talentEnum = NijisanjiTalentEnum(rawValue: video.channel.id), let talent = nijisanjiTalentEnumToTalent[talentEnum] {
                // talent exists here
                return SearchSuggestion(searchText: talent.names[.en]!, category: .name)
            } else {
                return SearchSuggestion(searchText: video.channel.name, category: .name)
            }
        }
        
        let japaneseNames: [SearchSuggestion] = self.videoList.map { video in
            if let talentEnum = NijisanjiTalentEnum(rawValue: video.channel.id), let talent = nijisanjiTalentEnumToTalent[talentEnum] {
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
