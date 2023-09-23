//
//  IntentAgencyAppEnum.swift
//  holo-wtf
//
//  Created by Haoyi An on 2023-09-18.
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

    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Agency")
    static var caseDisplayRepresentations: [Self: DisplayRepresentation] = [
        .hololive: "Hololive",
        .nijisanji: "Nijisanji",
        .react: "Re:AcT",
        .nanashiInc: "774 inc.",
        .noriPro: "Nori Pro",
        .vspo: "Vspo",
        .favourites: "Favourites"
    ]
}

