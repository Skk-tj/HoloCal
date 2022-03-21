//
//  Util.swift
//  holo-wtf
//
//
//

import Foundation
import UIKit

func getTimeIntervalFormatter() -> DateComponentsFormatter {
    let formatter = DateComponentsFormatter()
    formatter.maximumUnitCount = 1
    formatter.unitsStyle = .abbreviated
    formatter.allowedUnits = [.day, .hour, .minute]
    
    return formatter
}

func getTimeIntervalStringFromReferenceDate(reference date: Date) -> String? {
    let referenceDate: TimeInterval = date.timeIntervalSince1970
    let currentDate: TimeInterval = Date().timeIntervalSince1970
    
    let formatter = getTimeIntervalFormatter()
    
    return formatter.string(from: abs(currentDate - referenceDate))
}

func isLiveMengen(title: String) -> Bool {
    // Japanese
    if title.contains("メン限") {
        return true
    }
    
    // English
    if title.lowercased().contains("member") && title.lowercased().contains("only") {
        return true
    }
    
    return false
}

enum DataStatus {
    case working
    case success
    case fail
}
