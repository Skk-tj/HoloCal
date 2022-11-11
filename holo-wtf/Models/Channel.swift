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
        if let talentEnum = TalentEnum(rawValue: id) {
            return talentEnumToTalent[talentEnum]!
        } else {
            // Don't recognize this ID
            return nil
        }
    }
    
    static let testChannel = Channel(id: "UCp6993wxpyDPHUpavwDFqgg", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let testChannel2 = Channel(id: "UCDqI2jOz0weumE8s7paEk6g", name: "test vtuber 2", photo: URL(string: "https://yt3.ggpht.com/wIqM7MWDN94PoibzPmeog7WOt8jFKTKZBOBFEbLBaiUAdKLwoqdLC_CN7B7Gby-FWH-076rN=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    func getTalentGenerationName() -> String {
        if let talent = talent {
            if let generationGroup = talentsByGeneration[talent.inGeneration] {
                return generationGroup.localizedName
            } else {
                return talentsByGeneration[.other]!.localizedName
            }
        } else {
            return talentsByGeneration[.other]!.localizedName
        }
    }
    
    static func ==(c1: Self, c2: Self) -> Bool {
        c1.id == c2.id
    }
    
    func getTalentName() -> String {
        if let talent = talent {
            return talent.localizedName
        } else {
            return self.name
        }
    }
    
    func getAltTalentName() -> String {
        if let talent = talent {
            return talent.altLocalizedName
        } else {
            return self.name
        }
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
