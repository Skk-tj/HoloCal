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
    
    mutating func getExtendedChannelInfo() async {
        let logger = Logger()
        
        guard let apiURL = URL(string: "https://holodex.net/api/v2/channels/\(id)") else {
            logger.critical("API URL is not valid")
            return
        }
        
        let headers = ["Content-Type": "application/json", "X-APIKEY": Bundle.main.object(forInfoDictionaryKey: "HOLODEX_API_KEY") as! String]
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.cachePolicy = .useProtocolCachePolicy
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = getDateParser()
            
            let responseResult: Channel = try decoder.decode(Channel.self, from: data)
            
            self.twitter = responseResult.twitter
        } catch {
            logger.error("Netword request/JSON serialization failed when trying to get live data from API. ")
            debugPrint(error)
            logger.error("Error is: \(error.localizedDescription)")
            return
        }
    }
}
