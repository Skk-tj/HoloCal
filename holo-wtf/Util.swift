//
//  Util.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-22.
//

import Foundation
import UIKit
import OSLog

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

func isLiveMengen(live: LiveVideo) -> Bool {
    // Japanese
    if live.title.contains("メン限") {
        return true
    }
    
    // English
    if live.title.lowercased().contains("member") && live.title.lowercased().contains("only") {
        return true
    }
    
    if live.title.lowercased().contains("membership") {
        return true
    }
    
    if live.topicId == "membersonly" {
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

func getTwitterId(channelId: String) async throws -> String? {
    let logger = Logger()
    
    guard let apiURL = URL(string: "https://holodex.net/api/v2/channels/\(channelId)") else {
        logger.critical("API URL is not valid")
        return nil
    }
    
    let headers = ["Content-Type": "application/json", "X-APIKEY": Bundle.main.object(forInfoDictionaryKey: "HOLODEX_API_KEY") as! String]
    
    var request = URLRequest(url: apiURL)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    request.cachePolicy = .useProtocolCachePolicy
    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let decoder = getLiveVideoJSONDecoder()
    
    let responseResult: Channel = try decoder.decode(Channel.self, from: data)
    
    return responseResult.twitter
}

func getLiveVideoJSONDecoder() -> JSONDecoder {
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

extension Bundle {
    public var appName: String { getInfo("CFBundleName")  }
    public var displayName: String {getInfo("CFBundleDisplayName")}
    public var language: String {getInfo("CFBundleDevelopmentRegion")}
    public var identifier: String {getInfo("CFBundleIdentifier")}
    public var copyright: String {getInfo("NSHumanReadableCopyright").replacingOccurrences(of: "\\\\n", with: "\n") }
    
    public var appBuild: String { getInfo("CFBundleVersion") }
    public var appVersionLong: String { getInfo("CFBundleShortVersionString") }
    
    fileprivate func getInfo(_ str: String) -> String { infoDictionary?[str] as? String ?? "⚠️" }
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
