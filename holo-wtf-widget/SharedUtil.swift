//
//  SharedUtil.swift
//  holo-wtf
//
//
//

import Foundation
import WidgetKit
import Intents

protocol VideoTimelineEntry: TimelineEntry {
    var status: WidgetDataStatus { get }
    var agency: WidgetDeepLinkAgency { get }
}

protocol AgencyIntent: INIntent {
    var agency: IntentAgency { get set }
}

extension PastWidgetIntent: AgencyIntent { }
extension LiveWidgetIntent: AgencyIntent { }
extension UpcomingWidgetIntent: AgencyIntent { }

enum WidgetDataStatus {
    case ok
    case noVideo
    case network
}
