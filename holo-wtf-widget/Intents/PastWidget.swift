//
//  PastWidget.swift
//  holo-wtf
//
//  Created by Haoyi An on 2023-09-18.
//

import Foundation
import AppIntents

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct PastWidget: AppIntent, WidgetConfigurationIntent, CustomIntentMigratedAppIntent {
    static let intentClassName = "PastWidgetIntent"

    static var title: LocalizedStringResource = "Past Widget"
    static var description = IntentDescription("Intent for Past Widget")

    @Parameter(title: "Agency")
    var agency: IntentAgencyAppEnum?

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
}

