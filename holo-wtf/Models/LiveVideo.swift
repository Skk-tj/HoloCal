//
//  VideoNew.swift
//  holo-wtf
//
//
//

import Foundation

struct LiveVideo: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let topicId: String?
    let startScheduled: Date?
    let startActual: Date?
    /// Probably the actual start time of a stream?
    let availableAt: Date
    /// When the waiting room is published
    let publishedAt: Date?
    let liveViewers: Int?
    let mentions: [Channel]?
    let duration: Int
    
    var songs: [SongInStream]?
    var channel: Channel
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, availableAt: Date(), publishedAt: Date(), liveViewers: 12345, mentions: [Channel.testChannel, Channel.testChannel2], duration: 0, songs: nil, channel: Channel.testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: "abcd", title: "my debut live member only", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, availableAt: Date(), publishedAt: Date(), liveViewers: 12345, mentions: [Channel.testChannel, Channel.testChannel2], duration: 500, songs: nil, channel: Channel.testChannel)
    
    var url: URL? {
        URL(string: "https://www.youtube.com/watch?v=\(id)")
    }
    
    var isMengen: Bool {
        // Japanese
        if title.contains("メン限") || title.contains("メンバー限定") {
            return true
        }
        
        // English
        if title.lowercased().contains("member") && title.lowercased().contains("only") {
            return true
        }
        
        if title.lowercased().contains("membership") {
            return true
        }
        
        if topicId == "membersonly" {
            return true
        }
        
        return false
    }
    
    var isSupportedAgency: Bool {
        return AgencyEnum.allCases.map { $0.rawValue }.contains(channel.org)
    }
    
    func isAgency(agency: AgencyEnum) -> Bool {
        channel.org == agency.rawValue
    }
    
    var isPremiere: Bool {
        duration > 0
    }
    
    var endedAt: Date {
        return availableAt + Double(duration)
    }
}
