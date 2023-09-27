//
//  IntentAgencyAppEnum.swift
//  holo-wtf
//
//
//

import Foundation
import AppIntents

@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
enum IntentAgencyAppEnum: String, AppEnum {
    case hololive
    case nijisanji
    case react
    case nanashiInc
    case noriPro
    case vspo
    case favourites

    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "INTENT_AGENCY")
    static var caseDisplayRepresentations: [Self: DisplayRepresentation] = [
        .hololive: "AGENCY_HOLOLIVE",
        .nijisanji: "AGENCY_NIJISANJI",
        .react: "AGENCY_RE_ACT",
        .nanashiInc: "AGENCY_774",
        .noriPro: "AGENCY_NORI_PRO",
        .vspo: "AGENCY_VSPO",
        .favourites: "AGENCY_FAVOURITES"
    ]
}
