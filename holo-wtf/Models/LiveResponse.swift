//
//  LiveResponse.swift
//  holo-wtf
//
//
//

import Foundation

struct LiveResponse: Codable {
    let live: [LiveVideo]
    let upcoming: [LiveVideo]
    let ended: [LiveVideo]
    
    enum CodingKeys: String, CodingKey {
        case live = "live"
        case upcoming = "upcoming"
        case ended = "ended"
    }
}
