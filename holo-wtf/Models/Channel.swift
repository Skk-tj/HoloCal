//
//  ChannelNew.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-12.
//

import Foundation
import OSLog

struct Channel: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let photo: URL?
    let org: String?
    
    var twitter: String?
    var talent: Talent {
        talentsToName[TalentsEnum(rawValue: id)!]!
    }
}
