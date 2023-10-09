//
//  Generation.swift
//  holo-wtf
//
//
//

import Foundation

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
        .enPromise,
        .enAdvent,
        .devIsReGloss,
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
        .wave2023Mar30,
        .wave2023Apr26,
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
        .en8thWave,
        .nijisanjiOfficial
    ],
    .react: [
        .reAliz,
        .kaleidscope,
        .sinkirow,
        .parfait,
        .reMixx,
        // Re:AcT Gaming are not added for now due to them streaming on twitch
        .reactOfficial
    ],
    .nanashiInc: [
        .nanashiInc,
        .nanashiOfficial
    ],
    .noriPro: [
        .noriProSolo,
        .noriPro1stGen,
        .noriProGamers
    ],
    .vspo: [
        .lupinus,
        .iris,
        .cattleya,
        .vspo,
        .vspoOfficial
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
    
    /// Represent the agency this group belongs to
    let agency: AgencyEnum
}
