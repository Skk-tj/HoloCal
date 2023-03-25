//
//  Vtuberable.swift
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
