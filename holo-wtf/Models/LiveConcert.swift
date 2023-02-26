//
//  LiveConcert.swift
//  holo-wtf
//
//
//

import Foundation

enum LiveFormat: String, Codable, HoloCalLocalizable {
    case online = "Online"
    case irl = "Irl"
    case both = "Both"
    
    var localized: String {
        switch self {
        case .online:
            return NSLocalizedString("LIVE_FORMAT_ONLINE", comment: "")
        case .irl:
            return NSLocalizedString("LIVE_FORMAT_IRL", comment: "")
        case .both:
            return NSLocalizedString("LIVE_FORMAT_BOTH", comment: "")
        }
    }
}

enum Platform: String, Codable, HoloCalLocalizable {
    case niconico = "Niconico"
    case spwn = "Spwn"
    case tba = "Tba"
    case youtube = "Youtube"
    case zan = "Zan"
    case zaiko = "Zaiko"
    case other = "Other"
    
    var localized: String {
        switch self {
        case .niconico:
            return NSLocalizedString("PLATFORM_NICONICO", comment: "")
        case .spwn:
            return NSLocalizedString("PLATFORM_SPWN", comment: "")
        case .tba:
            return NSLocalizedString("PLATFORM_TBA", comment: "")
        case .youtube:
            return NSLocalizedString("PLATFORM_YOUTUBE", comment: "")
        case .zan:
            return NSLocalizedString("PLATFORM_ZAN", comment: "")
        case .zaiko:
            return NSLocalizedString("PLATFORM_ZAIKO", comment: "")
        case .other:
            return NSLocalizedString("PLATFORM_OTHER", comment: "")
        }
    }
}

enum JpyPrice: Decodable, Equatable, Hashable, HoloCalLocalizable {
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
    
    var localized: String {
        switch self {
        case .tbd:
            return NSLocalizedString("JPY_PRICE_TBD", comment: "")
        case .free:
            return NSLocalizedString("JPY_PRICE_FREE", comment: "")
        case .fixed(let price):
            return "\(price.formatted(.currency(code: "JPY")))"
        case .multiTier(let price):
            return "\(price.formatted(.currency(code: "JPY")))+"
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
    let officialLink: URL?
    
    static let previewDescription = """
    Free segment: https://www.youtube.com/watch?v=Ijlhnsx_FiQ
    Ticket link: https://riotmusic-live.zaiko.io/item/354008
    
    https://twitter.com/iori_m_RIOT/status/1616289241906176004
    """
    
    static let previewConcert = LiveConcert(id: UUID(), title: "Iori Matsunaga Birthday Live Part 1", format: .both, jpyPrice: .multiTier(7000), platform: .zaiko, description: previewDescription, startTime: .now - 3600, imageUrl: URL(string: "https://pbs.twimg.com/media/Fm42frAacAAw56R?format=jpg&name=small"), twitterUrl: URL(string: "https://twitter.com/iori_m_RIOT/status/1616289241906176004"), youtubeLink: nil, ticketLink: URL(string: "https://riotmusic-live.zaiko.io/item/354008"), officialLink: URL(string: "http://makeup.matereal.jp/"))
    static let previewConcertNoImage = LiveConcert(id: UUID(), title: "Iori Matsunaga Birthday Live Part 1", format: .both, jpyPrice: .multiTier(7000), platform: .zaiko, description: previewDescription, startTime: .now - 3600, imageUrl: nil, twitterUrl: URL(string: "https://twitter.com/iori_m_RIOT/status/1616289241906176004"), youtubeLink: nil, ticketLink: URL(string: "https://riotmusic-live.zaiko.io/item/354008"), officialLink: URL(string: "http://makeup.matereal.jp/"))
}
