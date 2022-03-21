//
//  Channel.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
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
