//
//  IntentSortByAppEnum.swift
//  holo-wtf
//
//  Created by Haoyi An on 2023-09-18.
//

import Foundation
import AppIntents

@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
enum IntentSortByAppEnum: String, AppEnum {
    case mostViewer
    case mostRecent

    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Sort By")
    static var caseDisplayRepresentations: [Self: DisplayRepresentation] = [
        .mostViewer: "Most Viewer",
        .mostRecent: "Most Recent"
    ]
}

