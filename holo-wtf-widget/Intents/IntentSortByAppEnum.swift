//
//  IntentSortByAppEnum.swift
//  holo-wtf
//
//
//

import Foundation
import AppIntents

@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
enum IntentSortByAppEnum: String, AppEnum {
    case mostViewer
    case mostRecent

    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "INTENT_SORT_BY")
    static var caseDisplayRepresentations: [Self: DisplayRepresentation] = [
        .mostViewer: "INTENT_SORT_BY_MOST_VIEWER",
        .mostRecent: "INTENT_SORT_BY_MOST_RECENT"
    ]
}

