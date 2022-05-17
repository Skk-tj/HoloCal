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
    @Published var twitterList: [String: String?]
    
    let service = VideoFetchService()
    
    init() {
        self.videoList = []
        self.dataStatus = .working
        self.twitterList = [:]
    }
    
    let logger = Logger()
    
    func getVideo(url: String, completion: @escaping ([LiveVideo]) -> Void) async {
        self.dataStatus = .working
        
        do {
            let getResult = try await VideoFetchService.shared.getVideos(from: url)
            completion(getResult)
            self.dataStatus = .success
        } catch {
            self.dataStatus = .fail
        }
    }
    
    func getTwitter() async throws -> [String: String?] {
        var twitterList: [String: String?] = [:]
        
        try await withThrowingTaskGroup(of: (String, String?).self) { group in
            for video in videoList {
                group.addTask {
                    return (video.channel.id, try await video.channel.getTwitterId())
                }
            }
            
            for try await (channelId, twitterId) in group {
                twitterList[channelId] = twitterId
            }
        }
        
        return twitterList
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
