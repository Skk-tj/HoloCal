//
//  Channel.swift
//  holo-wtf
//
//
//

import Foundation

struct LiveVideo: Codable, Identifiable, Hashable {
    let id: Int
    let ytVideoKey: String?
    let title: String
    let thumbnail: URL?
    let liveSchedule: Date?
    let liveStart: Date?
    let liveEnd: Date?
    let liveViewers: Int?
    let channel: Channel
}
