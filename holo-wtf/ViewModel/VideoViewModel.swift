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
    
    init() {
        self.videoList = []
        self.dataStatus = .working
        self.twitterList = [:]
    }
    
    let logger = Logger()
    
    func getVideo(url: String, completion: @escaping ([LiveVideo]) -> Void) async {
        self.dataStatus = .working
        
        guard let apiURL = URL(string: url) else {
            logger.critical("API URL is not valid")
            self.dataStatus = .fail
            return
        }
        
        let headers = ["Content-Type": "application/json", "X-APIKEY": Bundle.main.object(forInfoDictionaryKey: "HOLODEX_API_KEY") as! String]
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.cachePolicy = .useProtocolCachePolicy
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = getLiveVideoJSONDecoder()
            
            let responseResult: [LiveVideo] = try decoder.decode([LiveVideo].self, from: data)
            
            completion(responseResult)
            
            self.dataStatus = .success
        } catch {
            logger.error("Netword request/JSON serialization failed when trying to get live data from API. ")
            debugPrint(error)
            logger.error("Error is: \(error.localizedDescription)")
            self.dataStatus = .fail
            return
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

func getTwitterId(channelId: String) async throws -> String? {
    let logger = Logger()
    
    guard let apiURL = URL(string: "https://holodex.net/api/v2/channels/\(channelId)") else {
        logger.critical("API URL is not valid")
        return nil
    }
    
    let headers = ["Content-Type": "application/json", "X-APIKEY": Bundle.main.object(forInfoDictionaryKey: "HOLODEX_API_KEY") as! String]
    
    var request = URLRequest(url: apiURL)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    request.cachePolicy = .useProtocolCachePolicy
    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let decoder = getLiveVideoJSONDecoder()
    
    let responseResult: Channel = try decoder.decode(Channel.self, from: data)
    
    return responseResult.twitter
}
