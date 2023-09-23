//
//  SharedUtil.swift
//  holo-wtf
//
//
//

import Foundation
import WidgetKit
import AppIntents
import Intents

protocol VideoTimelineEntry: TimelineEntry {
    var status: WidgetDataStatus { get }
    var agency: WidgetDeepLinkAgency { get }
}

protocol AppIntentVideoTimelineEntry: TimelineEntry {
    var status: WidgetDataStatus { get }
    var agency: IntentAgencyAppEnum? { get }
}

protocol AgencyIntent: INIntent {
    var agency: IntentAgency { get set }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
protocol AgencyAppIntent: AppIntent, WidgetConfigurationIntent {
    var agency: IntentAgencyAppEnum? { get set }
}

extension PastWidgetIntent: AgencyIntent { }
extension LiveWidgetIntent: AgencyIntent { }
extension UpcomingWidgetIntent: AgencyIntent { }

enum WidgetDataStatus {
    case ok
    case noVideo
    case network
}
