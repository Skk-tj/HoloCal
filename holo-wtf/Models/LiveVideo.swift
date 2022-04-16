//
//  VideoNew.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-12.
//

import Foundation

struct LiveVideo: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let topicId: String?
    let startScheduled: Date?
    let startActual: Date?
    let liveViewers: Int
    
    var channel: Channel
}
