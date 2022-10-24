//
//  Channelable.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-10-22.
//

import Foundation
import OSLog

protocol Channel: Codable, Identifiable, Hashable, Equatable {
    associatedtype TalentType: Vtuberable
    
    var id: String { get }
    var name: String { get }
    var photo: URL? { get }
    var org: String? { get }
    
    var twitter: String? { get set }
    
    var talent: TalentType? { get }
    
    var channelURL: URL? { get }
    
    func getTalentName() -> String
    
    func getAltTalentName() -> String
    
    func getTalentGenerationName() -> String
    
    func getTwitterId() async throws -> String?
}


/// Default implementation for Channels
extension Channel {
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
        
        let responseResult: HololiveChannel = try decoder.decode(HololiveChannel.self, from: data)
        
        return responseResult.twitter
    }
}
