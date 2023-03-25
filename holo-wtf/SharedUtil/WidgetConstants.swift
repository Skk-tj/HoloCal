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
    case favourites
}

let intentAgencyToDeepLinkAgency: [IntentAgency: WidgetDeepLinkAgency] = [
    .unknown: .unknown,
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .noriPro: .noriPro,
    .favourites: .favourites
]

let widgetDeepLinkToViewAgency: [WidgetDeepLinkAgency: ViewAgency] = [
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .noriPro: .noriPro
]

let videoTypeToWidgetDeepLink: [VideoType: Tabs] = [
    .live: .live,
    .upcoming: .upcoming,
    .past: .past
]
