//
//  VideoViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog
import Algorithms

enum DataStatus {
    case working
    case success
    case fail
}

enum SortingOrder: Hashable {
    case asc
    case desc
}

enum SortingStrategy: Hashable {
    case viewers(SortingOrder)
    case time(SortingOrder)
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
        return LiveVideo(id: video.id, title: video.title, topicId: video.topicId, startScheduled: video.startScheduled, startActual: video.startActual, liveViewers: video.liveViewers, songs: video.songs, channel: await self.updatedWithTwitter(channel: video.channel))
    }
    
    private func updateSongWithMusicKit(song: SongInStream) async -> SongInStream {
        return SongInStream(id: song.id, start: song.start, end: song.end, name: song.name, originalArtist: song.originalArtist, itunesid: song.itunesid, MKsong: try? await song.getSongInfo())
    }
    
    private func updateVideoWithMusicKit(video: LiveVideo) async -> LiveVideo {
        if let songs = video.songs {
            return LiveVideo(id: video.id, title: video.title, topicId: video.topicId, startScheduled: video.startScheduled, startActual: video.startActual, liveViewers: video.liveViewers, songs: try? await getSongsForOneVideo(songList: songs), channel: video.channel)
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
    
    func getSearchSuggestions() -> [String] {
        let englishNames: [String] = self.videoList.map { video in talentsToName[TalentsEnum(rawValue: video.channel.id)!]!.names[.en]! }
        let japaneseNames: [String] = self.videoList.map { video in talentsToName[TalentsEnum(rawValue: video.channel.id)!]!.names[.ja]! }
        let allTags: [String] = self.videoList.compactMap { video in video.topicId }
        
        let suggestionsList: [String] = Array((englishNames + japaneseNames + allTags).uniqued())
        
        return suggestionsList
    }
    
    func sortVideos(by strategy: SortingStrategy) {
        switch strategy {
        case .viewers(let sortingOrder):
            switch sortingOrder {
            case .asc:
                self.videoList.sort(by: {$0.liveViewers < $1.liveViewers})
            case .desc:
                self.videoList.sort(by: {$0.liveViewers > $1.liveViewers})
            }
        case .time(let sortingOrder):
            switch sortingOrder {
            case .asc:
                self.videoList.sort(by: {$0.startActual ?? ($0.startScheduled ?? Date.distantFuture) < $1.startActual ?? ($1.startScheduled ?? Date.distantFuture)})
            case .desc:
                self.videoList.sort(by: {$0.startActual ?? ($0.startScheduled ?? Date.distantFuture) > $1.startActual ?? ($1.startScheduled ?? Date.distantFuture)})
            }
        }
    }
}
