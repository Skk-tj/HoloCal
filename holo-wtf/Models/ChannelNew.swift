//
//  ChannelNew.swift
//  holo-wtf
//
//
//

import Foundation

struct ChannelNew: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let photo: URL?
}
