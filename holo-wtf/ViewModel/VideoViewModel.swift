//
//  VideoViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

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
                    return (video.channel.id, try await getTwitterId(channelId: video.channel.id))
                }
            }
            
            for try await (channelId, twitterId) in group {
                twitterList[channelId] = twitterId
            }
        }
        
        return twitterList
    }
}
