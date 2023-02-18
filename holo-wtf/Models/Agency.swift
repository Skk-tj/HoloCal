//
//  Agency.swift
//  holo-wtf
//
//
//

import Foundation

/// A protocol that allows entities to have an ID, and names in different languages.
protocol Vtuberable {
    associatedtype ID
    
    var id: ID { get }
    /// Names in different language.
    var names: [NameLanguage: String] { get }
    
    var localizedName: String { get }
    var altLocalizedName: String { get }
}

/// Default implementation of getting the names.
extension Vtuberable {
    var localizedName: String {
        if let langCode = Locale.current.language.languageCode?.identifier {
            let lang: NameLanguage = langCode == "ja" ? .ja : .en
            return names[lang]!
        } else {
            return names[.en]!
        }
    }
    
    var altLocalizedName: String {
        if let langCode = Locale.current.language.languageCode?.identifier {
            let lang: NameLanguage = langCode == "ja" ? .en : .ja
            return names[lang]!
        } else {
            return names[.ja]!
        }
    }
}

enum AgencyEnum: String, CaseIterable {
    case hololive = "Hololive"
    case nijisanji = "Nijisanji"
    case react = "ReAcT"
    case nanashiInc = "774inc"
    
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
    AgencyEnum.nanashiInc: Agency(id: AgencyEnum.nanashiInc, names: [.en: "774 inc.", .ja: "774 inc."], icon: "7.circle")
]

let agencyEnumToGenerations: [AgencyEnum: [Generation]] = [
    .hololive: [
        .hololive0thGen,
        .hololive1stGen,
        .hololive2ndGen,
        .gamers,
        .hololive3rdGen,
        .hololive4thGen,
        .hololive5thGen,
        .holox,
        .id1stGen,
        .id2ndGen,
        .id3rdGen,
        .enMyth,
        .projectHope,
        .enCouncil,
        .stars1stGen,
        .stars2ndGen,
        .stars3rdGen,
        .uproar,
        .tempus,
        .hololiveOfficial
    ],
    .nijisanji: [
        .nijisanji1stGen,
        .nijisanji2ndGen,
        .gamers1stWave,
        .gamers2ndWave,
        .gamers3rdWave,
        .seeds1stGen,
        .seeds2ndGen1stWave,
        .seeds2ndGen2ndWave,
        .seeds2ndGen3rdWave,
        .wave2019Usa,
        .wave2019Jan28,
        .wave2019Sanbaka,
        .wave2019Beni,
        .wave2019Apr29,
        .wave2019May17,
        .wave2019Jun19,
        .wave2019SMC,
        .wave2019Blues,
        .wave2019Posanke,
        .wave2019Tulip,
        .wave2019Orihimeboshi,
        .wave2019AkaNoSoshiki,
        .wave2019NightKingdom,
        .wave2019Mananatsu,
        .wave2020Meifu,
        .wave2020Valz,
        .wave2020Jun30,
        .wave2020SereineJogakuin,
        .wave2021,
        .wave2022Ranunculus,
        .wave2022May21,
        .wave2022Voltaction,
        .wave2023Jan16,
        .id1stWave,
        .id2ndWave,
        .id3rdWave,
        .id4thWave,
        .id5thWave,
        .id6thWave,
        .kr1stWave,
        .kr2ndWave,
        .kr3rdWave,
        .kr4thWave,
        .kr5thWave,
        .kr6thWave,
        .en1stWave,
        .en2ndWave,
        .en3rdWave,
        .en4thWave,
        .en5thWave,
        .en6thWave,
        .en7thWave,
        .nijisanjiOfficial
    ],
    .react: [
        .reAliz,
        .kaleidscope,
        .sinkirow,
        .parfait,
        .reMixx,
        .reactOfficial
    ],
    .nanashiInc: [
        .animare,
        .honeyStrap,
        .sugarLyric,
        .hiyocyo,
        .soloTalent,
        .nanashiOfficial
    ]
]

/// Represent a person.
struct Talent: Identifiable, Vtuberable {
    /// The ID shall correspond to the ID given by the API, HoloDex API uses YT channel ID.
    let id: String
    
    /// Represent the name of the talent and the translation.
    ///
    /// - Example: `[.en: "Tokino Sora", .ja: "ときのそら"]`
    let names: [NameLanguage: String]
    
    /// Represent which generation (group) this talent is in.
    let inGeneration: Generation
}

/// Represent a group of talents in a VTuber agency
struct GenerationGroup: Identifiable, Hashable, Vtuberable {
    /// Represents the generation of this instance as an enum.
    let id: Generation
    
    /// Represent the names of a generation group
    let names: [NameLanguage: String]
    
    /// Represents a list of members.
    let members: [TalentEnum]
}


/// Available languages for the name of a struct, such as an agency, a generation, or a talent. 
///
/// For most international standards (except Chinese), we only need the original Japanese name and its Romaji representation (Hepburn).
enum NameLanguage: Codable {
    case en
    case ja
}
