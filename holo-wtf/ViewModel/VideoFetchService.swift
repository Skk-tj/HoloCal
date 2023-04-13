//
//  VideoFetchService.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog
#if canImport(Sentry) && os(iOS)
import Sentry
#endif

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
    
    guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "HOLODEX_API_KEY") as? String else {
        logger.critical("API Key is not valid")
        throw VideoFetchServiceError.apiUrlError
    }
    
    guard !apiKey.isEmpty else {
        logger.critical("API Key is empty")
        throw VideoFetchServiceError.apiUrlError
    }
    
    let headers = ["Content-Type": "application/json", "X-APIKEY": apiKey]
    
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
        logger.error("Network request failed when trying to get live data from API. This is likely a serialization error.")
        logger.error("Error is: \(error.localizedDescription)")
#if canImport(Sentry) && os(iOS)
        SentrySDK.capture(error: error)
#endif
        
        throw VideoFetchServiceError.serialization
    }
}

func getTwitterId(for channel: Channel) async throws -> String? {
    let logger = Logger()
    
    guard let apiURL = URL(string: "https://holodex.net/api/v2/channels/\(channel.id)") else {
        logger.critical("API URL is not valid")
        throw VideoFetchServiceError.apiUrlError
    }
    
    guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "HOLODEX_API_KEY") as? String else {
        logger.critical("API Key is not valid")
        throw VideoFetchServiceError.apiUrlError
    }
    
    let headers = ["Content-Type": "application/json", "X-APIKEY": apiKey]
    
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
        
        let responseResult = try decoder.decode(Channel.self, from: data)
        
        return responseResult.twitter
    } catch {
        logger.error("Network request failed when trying to get channel twitter data from API. This is likely a serialization error.")
        debugPrint(error)
        logger.error("Error is: \(error.localizedDescription)")
        
        throw VideoFetchServiceError.serialization
    }
}
