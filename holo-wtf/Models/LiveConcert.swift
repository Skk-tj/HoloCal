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
    let imageUrl: URL?
    let twitterUrl: URL?
    let youtubeLink: URL?
    let ticketLink: URL?
    
    static let previewDescription = """
    Free segment: https://www.youtube.com/watch?v=Ijlhnsx_FiQ
    Ticket link: https://riotmusic-live.zaiko.io/item/354008
    
    https://twitter.com/iori_m_RIOT/status/1616289241906176004
    """
    
    static let previewConcert = LiveConcert(id: UUID(), title: "Iori Matsunaga Birthday Live Part 1", format: .both, jpyPrice: .multiTier(7000), platform: .zaiko, description: previewDescription, startTime: .now - 3600, imageUrl: URL(string: "https://pbs.twimg.com/media/Fm42frAacAAw56R?format=jpg&name=small"), twitterUrl: URL(string: "https://twitter.com/iori_m_RIOT/status/1616289241906176004"), youtubeLink: nil, ticketLink: URL(string: "https://riotmusic-live.zaiko.io/item/354008"))
    static let previewConcertNoImage = LiveConcert(id: UUID(), title: "Iori Matsunaga Birthday Live Part 1", format: .both, jpyPrice: .multiTier(7000), platform: .zaiko, description: previewDescription, startTime: .now - 3600, imageUrl: nil, twitterUrl: URL(string: "https://twitter.com/iori_m_RIOT/status/1616289241906176004"), youtubeLink: nil, ticketLink: URL(string: "https://riotmusic-live.zaiko.io/item/354008"))
}
