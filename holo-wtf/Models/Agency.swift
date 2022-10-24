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

enum Agencies: String {
    case hololive = "Hololive"
    case nijisanji = "Nijisanji"
}

struct Agency: Vtuberable {
    let id: Agencies
    let names: [NameLanguage: String]
}

protocol Talent: Codable, Identifiable, Hashable, Vtuberable {
    associatedtype Generation
    
    var id: String { get }
    
    var names: [NameLanguage: String] { get }
    
    var inGeneration: Generation { get }
}

protocol Generation: Hashable, Vtuberable {
    associatedtype Generation
    associatedtype TalentEnum
    
    var id: Generation { get }
    
    var names: [NameLanguage: String] { get }
    
    var members: [TalentEnum] { get }
}

/// Represent a person.
struct HololiveTalent: Talent {
    /// The ID shall correspond to the ID given by the API, HoloDex API uses YT channel ID.
    let id: String
    
    /// Represent the name of the talent and the translation.
    ///
    /// - Example: `[.en: "Tokino Sora", .ja: "ときのそら"]`
    let names: [NameLanguage: String]
    
    /// Represent which generation (group) this talent is in.
    let inGeneration: HololiveGeneration
}

struct NijisanjiTalent: Talent {
    let id: String
    
    let names: [NameLanguage: String]
    
    let inGeneration: NijisanjiGeneration
}

/// Represent a group of talents in a VTuber agency
struct HololiveGenerationGroup: Generation {
    /// Represents the generation of this instance as an enum.
    let id: HololiveGeneration
    
    /// Represent the names of a generation group
    let names: [NameLanguage: String]
    
    /// Represents a list of members.
    let members: [HololiveTalentEnum]
}

struct NijisanjiGenerationGroup: Generation {
    let id: NijisanjiGeneration
    
    let names: [NameLanguage : String]
    
    let members: [NijisanjiTalentEnum]
}


/// Available languages for the name of a struct, such as an agency, a generation, or a talent. 
///
/// For most international standards (except Chinese), we only need the original Japanese name and its Romaji representation (Hepburn).
enum NameLanguage: Codable {
    case en
    case ja
}
