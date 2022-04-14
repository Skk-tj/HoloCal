//
//  ChannelNew.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-12.
//

import Foundation

struct ChannelNew: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let photo: URL?
}
