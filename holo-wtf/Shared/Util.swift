//
//  Util.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog
import EventKit

func getTimeIntervalFormatter() -> DateComponentsFormatter {
    let formatter = DateComponentsFormatter()
    formatter.maximumUnitCount = 1
    formatter.unitsStyle = .abbreviated
    formatter.allowedUnits = [.day, .hour, .minute]
    
    return formatter
}

func getDSTReminderTimeIntervalFormatter() -> DateComponentsFormatter {
    let formatter = DateComponentsFormatter()
    formatter.maximumUnitCount = 1
    formatter.unitsStyle = .full
    formatter.allowedUnits = [.day]
    
    return formatter
}

func getTimeIntervalStringFromReferenceDate(reference date: Date) -> String? {
    let dateDifference = date.timeIntervalSinceNow
    
    let formatter = getTimeIntervalFormatter()
    
    return formatter.string(from: abs(dateDifference))
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

func getLiveVideoJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX"
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    
    return decoder
}

func getCalendarEventFromVideo(eventStore: EKEventStore, video: LiveVideo) -> EKEvent {
    let event = EKEvent(eventStore: eventStore)
    event.title = video.title
    event.location = "https://www.youtube.com/channel/\(video.channel.id)"
    event.startDate = video.startScheduled
    event.endDate = video.startScheduled! + 5400
    event.url = URL(string: "https://www.youtube.com/watch?v=\(video.id)")
    event.calendar = eventStore.defaultCalendarForNewEvents
    
    return event
}

enum UserDefaultKeys {
    static let upcomingLookAhead = "upcomingLookAhead"
    static let isShowingAbsoluteTimeInLiveView = "isShowingAbsoluteTimeInLiveView"
    static let isShowingAbsoluteTimeInUpcomingView = "isShowingAbsoluteTimeInUpcomingView"
    static let isShowingCompactInLiveView = "isShowingCompactInLiveView"
    static let isShowingCompactInUpcomingView = "isShowingCompactInUpcomingView"
    static let isShowingDSTReminder = "isShowingDSTReminder"
    static let dstDays = "dstDays"
}

extension Bundle {
    public var appName: String { getInfo("CFBundleName")  }
    public var displayName: String {getInfo("CFBundleDisplayName")}
    public var language: String {getInfo("CFBundleDevelopmentRegion")}
    public var identifier: String {getInfo("CFBundleIdentifier")}
    public var copyright: String {getInfo("NSHumanReadableCopyright").replacingOccurrences(of: "\\\\n", with: "\n") }
    
    public var appBuild: String { getInfo("CFBundleVersion") }
    public var appVersionLong: String { getInfo("CFBundleShortVersionString") }
    
    public var codeName: String { "Peridot" }
    
    fileprivate func getInfo(_ str: String) -> String { infoDictionary?[str] as? String ?? "⚠️" }
}

// MARK: - AppStorage Support for Arrays
// https://stackoverflow.com/a/65598711/8233415
typealias Favourited = [String]

//extension Favourited: RawRepresentable {
//    public init?(rawValue: String) {
//        guard let data = rawValue.data(using: .utf8), let result = try? JSONDecoder().decode(Favourited.self, from: data)
//        else {
//            return nil
//        }
//        self = result
//    }
//
//    public var rawValue: String {
//        guard let data = try? JSONEncoder().encode(self), let result = String(data: data, encoding: .utf8)
//        else {
//            return "[]"
//        }
//        return result
//    }
//}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

extension Set: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode(Set<Element>.self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
