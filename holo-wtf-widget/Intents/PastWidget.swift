//
//  PastWidget.swift
//  holo-wtf
//
//
//

import Foundation
import AppIntents

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct PastWidget: AgencyAppIntent, CustomIntentMigratedAppIntent {
    static let intentClassName = "PastWidgetIntent"

    static var title: LocalizedStringResource = "PAST_WIDGET_DISPLAY_NAME"
    static var description = IntentDescription("PAST_WIDGET_DESCRIPTION")

    @Parameter(title: "INTENT_AGENCY")
    var agency: IntentAgencyAppEnum?

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
}
