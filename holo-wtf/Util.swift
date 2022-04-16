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
    
    if title.lowercased().contains("membership") {
        return true
    }
    
    return false
}

func getUpcomingStreamLookAheadHoursFromUserDefaults() -> Int {
    let defaults = UserDefaults.standard
    
    return defaults.integer(forKey: UserDefaultKeys.upcomingLookAhead) == 0 ? 48 : defaults.integer(forKey: UserDefaultKeys.upcomingLookAhead)
}

func getIsShowingAbsoluteTimeInLiveViewFromUserDefaults() -> Bool {
    let defaults = UserDefaults.standard
    
    return defaults.bool(forKey: UserDefaultKeys.isShowingAbsoluteTimeInLiveView)
}

func getIsShowingAbsoluteTimeInUpcomingViewFromUserDefaults() -> Bool {
    let defaults = UserDefaults.standard
    
    return defaults.bool(forKey: UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView)
}

func getIfChannelIdIsFavouriteFromUserDefault(id: Int) -> Bool {
    let defaults = UserDefaults.standard
    
    if let favouritedArray = defaults.array(forKey: "favouritedChannel2") as? [Int] {
        return favouritedArray.contains(where: {$0 == id})
    } else {
        defaults.set([], forKey: "favouritedChannel2")
        return false
    }
}

func appendChannelIdToFavouriteInUserDefault(id: Int) -> Void {
    let defaults = UserDefaults.standard
    
    if var favouritedArray = defaults.array(forKey: "favouritedChannel2") as? [Int] {
        // print("before append: \(favouritedArray)")
        favouritedArray.append(id)
        defaults.set(favouritedArray, forKey: "favouritedChannel2")
        
        // print("after append: \(defaults.array(forKey: UserDefaultKeys.favouritedChannel)!)")
    } else {
        defaults.set([], forKey: "favouritedChannel2")
    }
}

func removeChannelIdFromFavouriteInUserDefault(id: Int) -> Void {
    let defaults = UserDefaults.standard
    
    if var favouritedArray = defaults.array(forKey: "favouritedChannel2") as? [Int] {
        // print("before remove: \(favouritedArray)")
        favouritedArray.removeAll(where: { $0 == id })
        defaults.set(favouritedArray, forKey: "favouritedChannel2")
        
        // print("after remove: \(defaults.array(forKey: UserDefaultKeys.favouritedChannel)!)")
    } else {
        defaults.set([], forKey: "favouritedChannel2")
    }
}

func resetFavouriteInUserDefault() -> Void {
    let defaults = UserDefaults.standard
    defaults.set([], forKey: "favouritedChannel2")
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

enum UserDefaultKeys {
    static let upcomingLookAhead = "upcomingLookAhead"
    static let isShowingAbsoluteTimeInLiveView = "isShowingAbsoluteTimeInLiveView"
    static let isShowingAbsoluteTimeInUpcomingView = "isShowingAbsoluteTimeInUpcomingView"
    static let isShowingCompactInLiveView = "isShowingCompactInLiveView"
    static let isShowingCompactInUpcomingView = "isShowingCompactInUpcomingView"
}

// MARK: - AppStorage Support for Arrays
// https://stackoverflow.com/a/65598711/8233415
typealias Favourited = [String]

extension Favourited: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8), let result = try? JSONDecoder().decode(Favourited.self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self), let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
