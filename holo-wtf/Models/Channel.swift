//
//  ChannelNew.swift
//  holo-wtf
//
//
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
    
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
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
