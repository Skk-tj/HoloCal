//
//  VideoFetchService.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

enum VideoFetchServiceError: Error {
    case apiUrlError
    case serialization
    case network(Int)
}

func getVideos(from url: String) async throws -> [LiveVideo] {
    let logger = Logger()
    
    guard let apiURL = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
        logger.critical("API URL is not valid")
        throw VideoFetchServiceError.apiUrlError
    }
    
    let headers = ["Content-Type": "application/json", "X-APIKEY": Bundle.main.object(forInfoDictionaryKey: "HOLODEX_API_KEY") as? String ?? ""]
    
    var request = URLRequest(url: apiURL)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    request.cachePolicy = .useProtocolCachePolicy
    
    do {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw VideoFetchServiceError.network((response as? HTTPURLResponse)?.statusCode ?? 0)
        }
        
        let decoder = getLiveVideoJSONDecoder()
        
        let responseResult = try decoder.decode([LiveVideo].self, from: data)
        
        return responseResult
    } catch {
        logger.error("Network request failed when trying to get live data from API. ")
        debugPrint(error)
        logger.error("Error is: \(error.localizedDescription)")
        
        throw VideoFetchServiceError.network(-1)
    }
}
