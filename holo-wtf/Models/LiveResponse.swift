//
//  LiveResponse.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
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
