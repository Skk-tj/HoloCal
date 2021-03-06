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
    
    var talent: Talent? {
        if let talentEnum = TalentsEnum(rawValue: id) {
            return talentsToName[talentEnum]!
        } else {
            // Don't recognize this ID
            return nil
        }
    }
    
    var channelURL: URL? {
        URL(string: "https://www.youtube.com/channel/\(id)")
    }
    
    static let testChannel = Channel(id: "UCp6993wxpyDPHUpavwDFqgg", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let testChannel2 = Channel(id: "UCDqI2jOz0weumE8s7paEk6g", name: "test vtuber 2", photo: URL(string: "https://yt3.ggpht.com/wIqM7MWDN94PoibzPmeog7WOt8jFKTKZBOBFEbLBaiUAdKLwoqdLC_CN7B7Gby-FWH-076rN=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    func getTalentName(lang: NameLanguage) -> String {
        if let talent = self.talent {
            return talent.names[lang]!
        } else {
            return self.name
        }
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
