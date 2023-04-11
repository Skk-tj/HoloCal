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

    var talent: Talent? {
        if let talentEnum = TalentEnum(rawValue: id) {
            return talentEnumToTalent[talentEnum]!
        } else {
            // Don't recognize this ID
            return nil
        }
    }

    static let testChannel = Channel(id: "UCp6993wxpyDPHUpavwDFqgg", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")

    static let testChannel2 = Channel(id: "UCDqI2jOz0weumE8s7paEk6g", name: "test vtuber 2", photo: URL(string: "https://yt3.ggpht.com/wIqM7MWDN94PoibzPmeog7WOt8jFKTKZBOBFEbLBaiUAdKLwoqdLC_CN7B7Gby-FWH-076rN=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")

    func getTalentGenerationName() -> String {
        if let talent = talent {
            if let generationGroup = talentsByGeneration[talent.inGeneration] {
                return generationGroup.localizedName
            } else {
                return talentsByGeneration[.other]!.localizedName
            }
        } else {
            return talentsByGeneration[.other]!.localizedName
        }
    }
    
    static func == (c1: Self, c2: Self) -> Bool {
        c1.id == c2.id
    }
    
    func getTalentName() -> String {
        if let talent = talent {
            return talent.localizedName
        } else {
            return self.name
        }
    }
    
    func getAltTalentName() -> String {
        if let talent = talent {
            return talent.altLocalizedName
        } else {
            return self.name
        }
    }
    
    var channelURL: URL? {
        URL(string: "https://www.youtube.com/channel/\(id)")
    }
}
