//
//  VideoNew.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-12.
//

import Foundation
import HTMLString

struct LiveVideo: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let topicId: String?
    let startScheduled: Date?
    let startActual: Date?
    let liveViewers: Int
    
    var url: URL? {
        URL(string: "https://www.youtube.com/watch?v=\(id)")
    }
    
    var isMengen: Bool {
        // Japanese
        if title.contains("メン限") {
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
    
    var escapedTitle: String {
        title.removingHTMLEntities()
    }
    
    var channel: Channel
}
