//
//  WidgetLocalization.swift
//  holo-wtf
//
//
//

import Foundation

let intentAgencyToString: [IntentAgency: [NameLanguage: String]] = [
    .unknown: [.en: "All", .ja: "全部"],
    .hololive: intentAgencyToAgency[IntentAgency.hololive]!.getAgency().names,
    .nijisanji: intentAgencyToAgency[IntentAgency.nijisanji]!.getAgency().names,
    .react: intentAgencyToAgency[IntentAgency.react]!.getAgency().names,
    .nanashiInc: intentAgencyToAgency[IntentAgency.nanashiInc]!.getAgency().names,
    .noriPro: intentAgencyToAgency[IntentAgency.noriPro]!.getAgency().names,
    .vspo: intentAgencyToAgency[IntentAgency.vspo]!.getAgency().names
]

let intentAgencyToAgency: [IntentAgency: AgencyEnum] = [
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .noriPro: .noriPro,
    .vspo: .vspo
]

let intentSortByToString: [IntentSortBy: [NameLanguage: String]] = [
    .mostViewer: [.en: "Most Viewer", .ja: "視聴者数順"],
    .mostRecent: [.en: "Most Recent", .ja: "開始時間順"]
]

let intentVideoTypeToString: [VideoType: [NameLanguage: String]] = [
    .live: [.en: "Live", .ja: "配信中"],
    .upcoming: [.en: "Upcoming", .ja: "今後の配信"],
    .past: [.en: "Past", .ja: "アーカイブ"]
]

extension IntentAgency {
    var localizedName: String {
        if let langCode = Locale.current.language.languageCode?.identifier {
            let lang: NameLanguage = langCode == "ja" ? .ja : .en
            return intentAgencyToString[self]![lang]!
        } else {
            return intentAgencyToString[self]![.en]!
        }
    }
    
    var altLocalizedName: String {
        if let langCode = Locale.current.language.languageCode?.identifier {
            let lang: NameLanguage = langCode == "ja" ? .en : .ja
            return intentAgencyToString[self]![lang]!
        } else {
            return intentAgencyToString[self]![.ja]!
        }
    }
}

extension IntentSortBy {
    var localizedName: String {
        if let langCode = Locale.current.language.languageCode?.identifier {
            let lang: NameLanguage = langCode == "ja" ? .ja : .en
            return intentSortByToString[self]![lang]!
        } else {
            return intentSortByToString[self]![.en]!
        }
    }
    
    var altLocalizedName: String {
        if let langCode = Locale.current.language.languageCode?.identifier {
            let lang: NameLanguage = langCode == "ja" ? .en : .ja
            return intentSortByToString[self]![lang]!
        } else {
            return intentSortByToString[self]![.ja]!
        }
    }
}

func getIntentVideoTypeLocalizedName(_ videoType: VideoType) -> String {
    if let langCode = Locale.current.language.languageCode?.identifier {
        let lang: NameLanguage = langCode == "ja" ? .ja : .en
        return intentVideoTypeToString[videoType]![lang]!
    } else {
        return intentVideoTypeToString[videoType]![.en]!
    }
}

func getIntentVideoTypeAltLocalizedName(_ videoType: VideoType) -> String {
    if let langCode = Locale.current.language.languageCode?.identifier {
        let lang: NameLanguage = langCode == "ja" ? .en : .ja
        return intentVideoTypeToString[videoType]![lang]!
    } else {
        return intentVideoTypeToString[videoType]![.ja]!
    }
}
