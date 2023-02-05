//
//  LiveConcert.swift
//  holo-wtf
//
//
//

import Foundation

enum LiveFormat: String, Codable {
    case online = "Online"
    case irl = "Irl"
    case both = "Both"
}

enum Platform: String, Codable {
    case niconico = "Niconico"
    case spwn = "Spwn"
    case tba = "Tba"
    case youtube = "Youtube"
    case zan = "Zan"
    case zaiko = "Zaiko"
    case other = "Other"
}

enum JpyPrice: Decodable, Equatable, Hashable {
    case tbd
    case free
    case fixed(Int)
    case multiTier(Int)
    
    enum CodingKeys: String, CodingKey {
        case tag
        case content
    }
    
    enum Tag: String, Codable {
        case tbd = "Tbd"
        case free = "Free"
        case fixed = "Fixed"
        case multiTier = "MultiTier"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let tag: Tag = try container.decode(Tag.self, forKey: .tag)
        
        switch tag {
        case .tbd:
            self = .tbd
        case .free:
            self = .free
        case .fixed:
            let price = try container.decode(Int.self, forKey: .content)
            self = .fixed(price)
        case .multiTier:
            let price = try container.decode(Int.self, forKey: .content)
            self = .multiTier(price)
        }
    }
}

struct LiveConcert: Decodable, Hashable, Identifiable {
    let id: UUID
    let title: String
    let format: LiveFormat
    let jpyPrice: JpyPrice
    let platform: Platform
    let description: String
    let startTime: Date
    let imageURL: URL?
    let twitterURL: URL?
    let youtubeLink: URL?
    let ticketLink: URL?
}
