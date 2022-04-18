//
//  ChannelNew.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

struct Channel: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let photo: URL?
    let org: String?
    
    var twitter: String?
}
