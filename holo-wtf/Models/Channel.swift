//
//  ChannelNew.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-12.
//

import Foundation
import OSLog

struct Channel: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let photo: URL?
    let org: String?
    
    var twitter: String?
    
    var talent: Talent {
        talentsToName[TalentsEnum(rawValue: id)!]!
    }
    
    var channelURL: URL? {
        URL(string: "https://www.youtube.com/channel/\(id)")
    }
    
    func getTwitterId() async throws -> String? {
        let logger = Logger()
        
        guard let apiURL = URL(string: "https://holodex.net/api/v2/channels/\(id)") else {
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
}
