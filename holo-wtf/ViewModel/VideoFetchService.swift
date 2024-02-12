//
//  VideoFetchService.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

enum VideoFetchServiceError: LocalizedError {
    case apiUrlError
    case other(NSError)
    case network(Int)
    
    var errorDescription: String? {
        switch self {
        case .apiUrlError:
            return "API URL error during the initialization stage"
        case .other(let theError):
            return theError.localizedDescription
        case .network(let int):
            return "Network error \(int)"
        }
    }
}

func getVideos(for videoType: VideoType, agency: AgencyEnum) async throws -> [LiveVideo] {
    switch videoType {
    case .live:
        let videoUrl = getLiveUrl(for: agency)
        return try await getVideos(from: videoUrl)
    case .upcoming:
        let videoUrl = getUpcomingUrl(for: agency)
        return try await getVideos(from: videoUrl)
    case .past:
        switch getPastLimitFromUserDefaults() {
        case .limit25:
            let videoUrl = getPastUrl(for: agency)
            return try await getVideos(from: videoUrl)
        case .limit50:
            let videoUrl = getPastUrl(for: agency, limit: 50, offset: 0)
            return try await getVideos(from: videoUrl)
        case .limit100:
            let url1 = getPastUrl(for: agency, limit: 50, offset: 0)
            let url2 = getPastUrl(for: agency, limit: 50, offset: 50)
            
            return try await withThrowingTaskGroup(of: [LiveVideo].self) { group in
                [url1, url2].forEach { url in
                    group.addTask {
                        return try await getVideos(from: url)
                    }
                }
                
                return try await group.reduce(into: [LiveVideo]()) { partialResult, video in
                    partialResult.append(contentsOf: video)
                }
            }
        }
    }
}

func getVideos(from url: String) async throws -> [LiveVideo] {
    let logger = Logger()
    
    guard let apiURL = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
        logger.critical("API URL is not valid")
        throw VideoFetchServiceError.apiUrlError
    }
    
    guard let apiKey = (Bundle.main.object(forInfoDictionaryKey: "HOLODEX_API_KEY") as? String ?? getApiKeyFromUserDefaults()) else {
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
    request.cachePolicy = .reloadIgnoringLocalCacheData
    
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
        
        throw VideoFetchServiceError.other(error as NSError)
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
        logger.error("Error is: \(error.localizedDescription)")
        
        throw VideoFetchServiceError.other(error as NSError)
    }
}
