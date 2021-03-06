//
//  VideoViewModel.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import Foundation
import OSLog
import Algorithms

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
    
    let service = VideoFetchService()
    
    init() {
        self.videoList = []
        self.dataStatus = .working
    }
    
    let logger = Logger()
    
    func getVideo(url: String, completion: @escaping ([LiveVideo]) -> Void) async {
        self.dataStatus = .working
        
        do {
            let getResult = try await VideoFetchService.shared.getVideos(from: url)
            let getResultWithTwitter = try await getTwitterForAll(videoList: getResult)
            let getResultWithSongs = try await getSongsForAll(videoList: getResultWithTwitter)
        
            completion(getResultWithSongs)
            self.dataStatus = .success
        } catch {
            self.dataStatus = .fail
        }
    }
    
    private func updatedWithTwitter(channel: Channel) async -> Channel {
        return Channel(id: channel.id, name: channel.name, photo: channel.photo, org: channel.org, twitter: try? await channel.getTwitterId())
    }
    
    private func updatedWithTwitter(video: LiveVideo) async -> LiveVideo {
        return LiveVideo(id: video.id, title: video.title, topicId: video.topicId, startScheduled: video.startScheduled, startActual: video.startActual, liveViewers: video.liveViewers, mentions: video.mentions, songs: video.songs, channel: await self.updatedWithTwitter(channel: video.channel))
    }
    
    private func updateSongWithMusicKit(song: SongInStream) async -> SongInStream {
        return SongInStream(id: song.id, start: song.start, end: song.end, name: song.name, originalArtist: song.originalArtist, itunesid: song.itunesid, MKsong: try? await song.getSongInfo())
    }
    
    private func updateVideoWithMusicKit(video: LiveVideo) async -> LiveVideo {
        if let songs = video.songs {
            return LiveVideo(id: video.id, title: video.title, topicId: video.topicId, startScheduled: video.startScheduled, startActual: video.startActual, liveViewers: video.liveViewers, mentions: video.mentions, songs: try? await getSongsForOneVideo(songList: songs), channel: video.channel)
        } else {
            return video
        }
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
    
    private func getSongsForOneVideo(songList: [SongInStream]) async throws -> [SongInStream] {
        var newSongs: [SongInStream] = []
        newSongs.reserveCapacity(songList.count)
        
        try await withThrowingTaskGroup(of: SongInStream.self) { group in
            songList.forEach { song in
                group.addTask {
                    return await self.updateSongWithMusicKit(song: song)
                }
            }
            
            for try await song in group {
                newSongs.append(song)
            }
        }
        
        // sort the songs by starting time
        newSongs.sort { $0.start < $1.start }
        
        return newSongs
    }
    
    func getSongsForAll(videoList: [LiveVideo]) async throws -> [LiveVideo] {
        var newVideos: [LiveVideo] = []
        newVideos.reserveCapacity(videoList.count)
        
        try await withThrowingTaskGroup(of: LiveVideo.self) { group in
            videoList.forEach { video in
                group.addTask {
                    await self.updateVideoWithMusicKit(video: video)
                }
            }

            for try await video in group {
                newVideos.append(video)
            }
        }
        
        return newVideos
    }
    
    func getSearchSuggestions() -> [SearchSuggestion] {
        let englishNames: [SearchSuggestion] = self.videoList.map { video in
            if let talentEnum = TalentsEnum(rawValue: video.channel.id), let talent = talentsToName[talentEnum] {
                // talent exists here
                return SearchSuggestion(searchText: talent.names[.en]!, category: .name)
            } else {
                return SearchSuggestion(searchText: video.channel.name, category: .name)
            }
        }
        
        let japaneseNames: [SearchSuggestion] = self.videoList.map { video in
            if let talentEnum = TalentsEnum(rawValue: video.channel.id), let talent = talentsToName[talentEnum] {
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
