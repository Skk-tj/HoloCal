//
//  LiveVideo.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-10-22.
//

import Foundation

protocol LiveVideo: Codable, Identifiable, Hashable {
    associatedtype ChannelType: Channel
    
    var id: String { get }
    var title: String { get }
    var topicId: String? { get }
    var startScheduled: Date? { get }
    var startActual: Date? { get }
    var liveViewers: Int { get }
    
    var mentions: [ChannelType]? { get }
    
    var songs: [SongInStream]? { get set }
    var channel: ChannelType { get set }
    
    var url: URL? { get }
    
    var isMengen: Bool { get }
}

extension LiveVideo {
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
    
    var isHololive: Bool {
        channel.org == Agencies.hololive.rawValue
    }
    
    var isNijisanji: Bool {
        channel.org == Agencies.nijisanji.rawValue
    }
}
