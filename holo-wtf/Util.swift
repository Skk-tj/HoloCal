//
//  Util.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-22.
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
    let dateDifference = date.timeIntervalSinceNow
    
    let formatter = getTimeIntervalFormatter()
    
    return formatter.string(from: abs(dateDifference))
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

func getUpcomingStreamLookAheadHoursFromUserDefaults() -> Int {
    let defaults = UserDefaults.standard
    
    return defaults.integer(forKey: "upcomingLookAhead") == 0 ? 48 : defaults.integer(forKey: "upcomingLookAhead")
}

func getIsShowingAbsoluteTimeInLiveViewFromUserDefaults() -> Bool {
    let defaults = UserDefaults.standard
    
    return defaults.bool(forKey: "isShowingAbsoluteTimeInLiveView")
}

func getIsShowingAbsoluteTimeInUpcomingViewFromUserDefaults() -> Bool {
    let defaults = UserDefaults.standard
    
    return defaults.bool(forKey: "isShowingAbsoluteTimeInUpcomingView")
}

func getAbsoluteDateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    
    return formatter
}

func getDateParser() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX"
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    
    return decoder
}

enum DataStatus {
    case working
    case success
    case fail
}
