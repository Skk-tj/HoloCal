//
//  WidgetConstants.swift
//  holo-wtf
//
//
//

import Foundation

let widgetDeepLink = "holocal://widget-launch/%@/%@"

/// Ugh, one-to-one copy of `IntentAgency`
enum WidgetDeepLinkAgency: String {
    case unknown
    case hololive
    case nijisanji
    case react
    case nanashiInc
    case noriPro
    case vspo
    case favourites
}

let intentAgencyToDeepLinkAgency: [IntentAgency: WidgetDeepLinkAgency] = [
    .unknown: .unknown,
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .noriPro: .noriPro,
    .vspo: .vspo,
    .favourites: .favourites
]

let widgetDeepLinkToViewAgency: [WidgetDeepLinkAgency: ViewAgency] = [
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .vspo: .vspo,
    .noriPro: .noriPro,
    .favourites: .favourites
]

let videoTypeToWidgetDeepLink: [VideoType: Tabs] = [
    .live: .live,
    .upcoming: .upcoming,
    .past: .past
]
