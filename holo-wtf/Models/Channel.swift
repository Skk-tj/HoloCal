//
//  Channel;.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
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
