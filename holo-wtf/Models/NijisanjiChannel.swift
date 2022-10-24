//
//  NijisanjiChannel.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-10-22.
//

import Foundation

struct NijisanjiChannel: Channel {
    let id: String
    let name: String
    let photo: URL?
    let org: String?
    
    var twitter: String?
    
    var talent: NijisanjiTalent? {
        if let talentEnum = NijisanjiTalentEnum(rawValue: id) {
            return nijisanjiTalentEnumToTalent[talentEnum]!
        } else {
            // Don't recognize this ID
            return nil
        }
    }
    
    static let testChannel = NijisanjiChannel(id: "UCp6993wxpyDPHUpavwDFqgg", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Nijisanji", twitter: "aaaa")
    
    static let testChannel2 = NijisanjiChannel(id: "UCDqI2jOz0weumE8s7paEk6g", name: "test vtuber 2", photo: URL(string: "https://yt3.ggpht.com/wIqM7MWDN94PoibzPmeog7WOt8jFKTKZBOBFEbLBaiUAdKLwoqdLC_CN7B7Gby-FWH-076rN=s800-c-k-c0x00ffffff-no-rj"), org: "Nijisanji", twitter: "aaaa")
    
    func getTalentGenerationName() -> String {
        if let talent = talent {
            if let generationGroup = nijisanjiTalentsByGenerations[talent.inGeneration] {
                return generationGroup.localizedName
            } else {
                return nijisanjiTalentsByGenerations[.other]!.localizedName
            }
        } else {
            return nijisanjiTalentsByGenerations[.other]!.localizedName
        }
    }
}
