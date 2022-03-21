//
//  Channel;.swift
//  holo-wtf
//
//
//

import Foundation

struct Channel: Codable, Identifiable, Hashable {
    let id: Int
    let ytChannelId: String?
    let name: String
    let description: String?
    let photo: URL?
    let publishedAt: Date
    let twitterLink: String?
}
