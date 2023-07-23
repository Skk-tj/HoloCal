//
//  Agency.swift
//  holo-wtf
//
//
//

import Foundation

enum AgencyEnum: String, CaseIterable, Codable {
    case hololive = "Hololive"
    case nijisanji = "Nijisanji"
    case react = "ReAcT"
    case nanashiInc = "774inc"
    case noriPro = "Nori Pro"
    case vspo = "VSpo"
    
    func getAgency() -> Agency {
        return agencyEnumToAgency[self]!
    }
}

struct Agency: Identifiable, Hashable, Vtuberable {
    let id: AgencyEnum
    let names: [NameLanguage: String]
    let icon: String
}

let agencyEnumToAgency = [
    AgencyEnum.hololive: Agency(id: AgencyEnum.hololive, names: [.en: "Hololive", .ja: "ホロライブ"], icon: "arrowtriangle.right.fill"),
    AgencyEnum.nijisanji: Agency(id: AgencyEnum.nijisanji, names: [.en: "Nijisanji", .ja: "にじさんじ"], icon: "dot.radiowaves.right"),
    AgencyEnum.react: Agency(id: AgencyEnum.react, names: [.en: "Re:AcT", .ja: "Re:AcT"], icon: "r.square"),
    AgencyEnum.nanashiInc: Agency(id: AgencyEnum.nanashiInc, names: [.en: "774 inc.", .ja: "774 inc."], icon: "7.circle"),
    AgencyEnum.noriPro: Agency(id: AgencyEnum.noriPro, names: [.en: "Nori Pro", .ja: "のりプロ"], icon: "sun.max.fill"),
    AgencyEnum.vspo: Agency(id: AgencyEnum.vspo, names: [.en: "Virtual eSports Project", .ja: "ぶいすぽっ！"], icon: "target")
]

/// Available languages for the name of a struct, such as an agency, a generation, or a talent. 
///
/// For most international standards (except Chinese), we only need the original Japanese name and its Romaji representation (Hepburn).
enum NameLanguage: Int, Codable {
    case en
    case ja
}
