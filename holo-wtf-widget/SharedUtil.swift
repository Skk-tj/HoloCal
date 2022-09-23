//
//  SharedUtil.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-18.
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
