//
//  VideoFetchService.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-14.
//

import Foundation
import OSLog

enum VideoFetchServiceError: Error {
    case apiUrlError
    case serialization
    case network
}

final class VideoFetchService {
    static let shared = VideoFetchService()
    
    let logger = Logger()
    
    func getVideos(from url: String) async throws -> [LiveVideo] {
        guard let apiURL = URL(string: url) else {
            logger.critical("API URL is not valid")
            throw VideoFetchServiceError.apiUrlError
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
            
            return responseResult
        } catch {
            logger.error("Netword request failed when trying to get live data from API. ")
            debugPrint(error)
            logger.error("Error is: \(error.localizedDescription)")
            
            throw VideoFetchServiceError.network
        }
    }
}
