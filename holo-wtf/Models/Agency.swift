//
//  Agency.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-10-09.
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
        if #available(iOS 16, *) {
            if let langCode = Locale.current.language.languageCode?.identifier {
                let lang: NameLanguage = langCode == "ja" ? .en : .ja
                return names[lang]!
            } else {
                return names[.ja]!
            }
        } else {
            let lang: NameLanguage = Locale.current.languageCode == "ja" ? .en : .ja
            return names[lang]!
        }
    }
    
    var altLocalizedName: String {
        if #available(iOS 16, *) {
            if let langCode = Locale.current.language.languageCode?.identifier {
                let lang: NameLanguage = langCode == "ja" ? .ja : .en
                return names[lang]!
            } else {
                return names[.en]!
            }
        } else {
            let lang: NameLanguage = Locale.current.languageCode == "ja" ? .ja : .en
            return names[lang]!
        }
    }
}

enum AgencyEnum: String {
    case hololive = "Hololive"
    case nijisanji = "Nijisanji"
}

struct Agency: Identifiable, Hashable, Vtuberable {
    let id: AgencyEnum
    let names: [NameLanguage: String]
}

let agencyEnumToAgency = [
    AgencyEnum.hololive: Agency(id: AgencyEnum.hololive, names: [.en: "Hololive", .ja: "ホロライブ"]),
    AgencyEnum.nijisanji: Agency(id: AgencyEnum.nijisanji, names: [.en: "Nijisanji", .ja: "にじさんじ"]),
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
