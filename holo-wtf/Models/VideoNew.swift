//
//  VideoNew.swift
//  holo-wtf
//
//
//

import Foundation

struct VideoNew: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let topicId: String
    let startScheduled: Date
    let startActual: Date
    let liveViewers: Int
    let channel: ChannelNew
}
