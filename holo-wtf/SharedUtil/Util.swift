//
//  Util.swift
//  holo-wtf
//
//
//

import Foundation
import EventKit
import SwiftUI

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

func getDateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short
    dateFormatter.locale = .autoupdatingCurrent
    
    return dateFormatter
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

func getFavouritesFromUserDefaults(groupName: String? = nil) -> [String] {
    if let groupName {
        if let defaults = UserDefaults(suiteName: groupName) {
            let rawString = defaults.string(forKey: UserDefaultKeys.favouritedChannel) ?? ""
            
            let decoded = try? JSONDecoder().decode([String].self, from: rawString.data(using: .utf8)!)
            
            return decoded ?? []
        } else {
            return []
        }
    } else {
        let defaults = UserDefaults.standard
        
        let rawString = defaults.string(forKey: UserDefaultKeys.favouritedChannel) ?? ""
        
        let decoded = try? JSONDecoder().decode([String].self, from: rawString.data(using: .utf8)!)
        
        return decoded ?? []
    }
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

func getLiveConcertJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .iso8601
    
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
    static let favouritedChannel = "favouritedChannel"
    static let isShowingAbsoluteTimeInLiveView = "isShowingAbsoluteTimeInLiveView"
    static let isShowingAbsoluteTimeInUpcomingView = "isShowingAbsoluteTimeInUpcomingView"
    static let isShowingAbsoluteTimeInPastView = "isShowingAbsoluteTimeInPastView"
    static let isShowingCompactInLiveView = "isShowingCompactInLiveView"
    static let isShowingCompactInUpcomingView = "isShowingCompactInUpcomingView"
    static let isShowingCompactInPastView = "isShowingCompactInPastView"
    static let isShowingDSTReminder = "isShowingDSTReminder"
    static let dstDays = "dstDays"
}

extension Bundle {
    public var appName: String { getInfo("CFBundleName")  }
    public var displayName: String { getInfo("CFBundleDisplayName") }
    public var language: String { getInfo("CFBundleDevelopmentRegion") }
    public var identifier: String { getInfo("CFBundleIdentifier") }
    public var copyright: String { getInfo("NSHumanReadableCopyright").replacingOccurrences(of: "\\\\n", with: "\n") }
    
    public var appBuild: String { getInfo("CFBundleVersion") }
    public var appVersionLong: String { getInfo("CFBundleShortVersionString") }
    
    public var codeName: String { "Hitogata" }
    
    fileprivate func getInfo(_ str: String) -> String { infoDictionary?[str] as? String ?? "⚠️" }
}

// MARK: - AppStorage Support for Arrays
// https://stackoverflow.com/a/65598711/8233415
typealias Favourited = [String]

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8), let result = try? JSONDecoder().decode([Element].self, from: data) else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self), let result = String(data: data, encoding: .utf8) else {
            return "[]"
        }
        return result
    }
}

extension Set: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8), let result = try? JSONDecoder().decode(Set<Element>.self, from: data) else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self), let result = String(data: data, encoding: .utf8) else {
            return "[]"
        }
        return result
    }
}

protocol HoloCalLocalizable {
    var localized: String { get }
}

func getLiveUrl(for agency: AgencyEnum) -> String {
    return "https://holodex.net/api/v2/live?org=\(agency.rawValue)&status=live&type=stream&include=songs,mentions"
}

func getUpcomingUrl(for agency: AgencyEnum) -> String {
    return "https://holodex.net/api/v2/live?status=upcoming&type=stream&org=\(agency.rawValue)&include=songs,mentions&max_upcoming_hours=\(getUpcomingStreamLookAheadHoursFromUserDefaults())"
}

func getWidgetUpcomingUrl(for agency: AgencyEnum) -> String {
    return "https://holodex.net/api/v2/live?org=\(agency.rawValue)&status=upcoming&type=stream"
}

func getPastUrl(for agency: AgencyEnum) -> String {
    return "https://holodex.net/api/v2/videos?status=past&type=stream&include=songs,mentions&org=\(agency.rawValue)"
}

func getGenerationOrderList(@AppStorage("generationListOrderNew") from data: Data, agency: AgencyEnum) -> [Generation] {
    guard let deserialized = try? JSONDecoder().decode([AgencyEnum: [Generation]].self, from: data) else {
        return agencyEnumToGenerations[agency]!
    }
    
    return deserialized[agency]!
}

func appendNewGenerationOrderList(@AppStorage("generationListOrderNew") to data: Data, order: Set<Generation>, agency: AgencyEnum) {
    guard var deserialized = try? JSONDecoder().decode([AgencyEnum: [Generation]].self, from: data) else { return }
    deserialized[agency]!.append(contentsOf: order)
    
    data = (try? JSONEncoder().encode(deserialized)) ?? Data()
}

func overwriteNewGenerationOrderList(@AppStorage("generationListOrderNew") to data: Data, order: [Generation], agency: AgencyEnum) {
    guard var deserialized = try? JSONDecoder().decode([AgencyEnum: [Generation]].self, from: data) else { return }
    deserialized[agency] = order
    
    data = (try? JSONEncoder().encode(deserialized)) ?? Data()
}
