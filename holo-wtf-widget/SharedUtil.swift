//
//  SharedUtil.swift
//  holo-wtf
//
//
//

import Foundation
import WidgetKit

protocol VideoTimelineEntry: TimelineEntry {
    var status: WidgetDataStatus { get }
}

enum WidgetDataStatus {
    case ok
    case noVideo
    case network
}
