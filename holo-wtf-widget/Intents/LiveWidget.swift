//
//  LiveWidget.swift
//  holo-wtf
//
//  Created by Haoyi An on 2023-09-18.
//

import Foundation
import AppIntents

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct LiveWidget: AppIntent, WidgetConfigurationIntent, CustomIntentMigratedAppIntent {
    static let intentClassName = "LiveWidgetIntent"

    static var title: LocalizedStringResource = "Live Widget"
    static var description = IntentDescription("Intent for Live Widget")

    @Parameter(title: "Agency")
    var agency: IntentAgencyAppEnum?

    @Parameter(title: "Sort By")
    var sortBy: IntentSortByAppEnum?

    static var parameterSummary: some ParameterSummary {
        Summary()
    }

    func perform() async throws -> some IntentResult {
        // TODO: Place your refactored intent handler code here.
        return .result()
    }
}

@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
fileprivate extension IntentDialog {
    static func agencyParameterDisambiguationIntro(count: Int, agency: IntentAgencyAppEnum) -> Self {
        "There are \(count) options matching ‘\(agency)’."
    }
    static func agencyParameterConfirmation(agency: IntentAgencyAppEnum) -> Self {
        "Just to confirm, you wanted ‘\(agency)’?"
    }
    static func sortByParameterDisambiguationIntro(count: Int, sortBy: IntentSortByAppEnum) -> Self {
        "There are \(count) options matching ‘\(sortBy)’."
    }
    static func sortByParameterConfirmation(sortBy: IntentSortByAppEnum) -> Self {
        "Just to confirm, you wanted ‘\(sortBy)’?"
    }
}

