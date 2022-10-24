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
    case network
}

func getVideos<T: LiveVideo>(from url: String) async throws -> [T] {
    let logger = Logger()
    
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
        
        let responseResult: [T] = try decoder.decode([T].self, from: data)
        
        return responseResult
    } catch {
        logger.error("Network request failed when trying to get live data from API. ")
        debugPrint(error)
        logger.error("Error is: \(error.localizedDescription)")
        
        throw VideoFetchServiceError.network
    }
}
