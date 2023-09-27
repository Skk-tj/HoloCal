//
//  LiveWidget.swift
//  holo-wtf
//
//
//

import Foundation
import AppIntents

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct LiveWidget: AgencyAppIntent, CustomIntentMigratedAppIntent {
    static let intentClassName = "LiveWidgetIntent"

    static var title: LocalizedStringResource = "CURRENTLY_LIVE_WIDGET_DISPLAY_NAME"
    static var description = IntentDescription("CURRENTLY_LIVE_WIDGET_DESCRIPTION")

    @Parameter(title: "INTENT_AGENCY")
    var agency: IntentAgencyAppEnum?

    @Parameter(title: "INTENT_SORT_BY")
    var sortBy: IntentSortByAppEnum?

    static var parameterSummary: some ParameterSummary {
        Summary()
    }

    func perform() async throws -> some IntentResult {
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
