//
//  NotificationUtil.swift
//  holo-wtf
//
//
//

import Foundation
import UserNotifications
import SwiftUI
import OSLog
import Sentry

struct LiveVideoNotification: Codable, Hashable {
    let minutesBefore: NotificationMinutesBefore
    let finalNotificationTime: Date
    let notificationIdentifier: UUID
}

enum NotificationMinutesBefore: CaseIterable, Codable {
    case minute5
    case minute10
    case minute20
    
    func toActualNumber() -> Int {
        switch self {
        case .minute5:
            return 5
        case .minute10:
            return 10
        case .minute20:
            return 20
        }
    }
    
    func getManagementDescription() -> String {
        return String(format: NSLocalizedString("NOTIFICATION_MINUTES_BEFORE %lld", comment: ""), self.toActualNumber())
        // return String.localizedStringWithFormat("NOTIFICATION_MINUTES_BEFORE %lld", self.toActualNumber())
    }
}

typealias LiveVideoToNotification = [LiveVideo: LiveVideoNotification]

func scheduledNotification(@AppStorage(UserDefaultKeys.notifications) storage: Data, video: LiveVideo, minutesBefore: NotificationMinutesBefore) throws {
    let notifications = UserDefaults.standard.data(forKey: UserDefaultKeys.notifications) ?? Data()
    
    let isScheduled = isNotificationScheduledFor(storage: notifications, thisVideo: video)
    let notificationCenter = UNUserNotificationCenter.current()
    
    switch isScheduled {
    case .yes(let notification):
        // OK, let's see if the minute is different
        if notification.minutesBefore != minutesBefore {
            // we want to reschedule
            // 1. cancel the original one
            notificationCenter.removePendingNotificationRequests(withIdentifiers: [notification.notificationIdentifier.uuidString])
            // 2. schedule a new one
            
            try addNotificationToCenter(storage: storage, video: video, minutesBefore: minutesBefore)
        }
    case .no:
        try addNotificationToCenter(storage: storage, video: video, minutesBefore: minutesBefore)
    }
}

func addNotificationToCenter(@AppStorage(UserDefaultKeys.notifications) storage: Data, video: LiveVideo, minutesBefore: NotificationMinutesBefore) throws {
    let notificationCenter = UNUserNotificationCenter.current()
    
    let time = (video.startScheduled ?? video.availableAt)
    guard let notificationTime = Calendar.autoupdatingCurrent.date(byAdding: .minute, value: -minutesBefore.toActualNumber(), to: time) else {
        throw NotificationError.invalidDate
    }
    
    let dateComponent = Calendar.current.dateComponents([.calendar, .year, .month, .day, .hour, .minute, .second], from: notificationTime)
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
    
    let content = UNMutableNotificationContent()
    // content.title = String.localizedStringWithFormat(NSLocalizedString("NOTIFICATION_TITLE %@ %lld", comment: ""), video.channel.getTalentName(), minutesBefore.toActualNumber())
    content.title = NSString.localizedUserNotificationString(forKey: "NOTIFICATION_TITLE %@ %lld", arguments: [video.channel.getTalentName(), minutesBefore.toActualNumber()])
    content.subtitle = video.channel.name
    content.body = NSString.localizedUserNotificationString(forKey: "NOTIFICATION_BODY %@ %@ %lld", arguments: [video.channel.getTalentName(), video.title, minutesBefore.toActualNumber()])
    // content.body = String.localizedStringWithFormat(NSLocalizedString("NOTIFICATION_BODY %@ %@ %lld", comment: ""), video.channel.getTalentName(), video.title, minutesBefore.toActualNumber())
    
    content.userInfo["agency"] = video.channel.talent?.inGeneration.getGeneration().agency.rawValue
    content.userInfo["id"] = video.id
    
    // Create the request
    let uuid = UUID()
    let request = UNNotificationRequest(identifier: uuid.uuidString, content: content, trigger: trigger)
    
    // Schedule the request with the system.
    notificationCenter.add(request) { (error) in
        if let error {
            Logger().error("Cannot schedule notification for video: \(video.id), the scheduled date is \(dateComponent)")
            SentrySDK.capture(error: error)
        }
    }
    
    addToNotificationSchedule(storage: storage, thisVideo: video, notificationIdentifier: uuid, minutesBefore: minutesBefore, finalNotificationTime: notificationTime)
}

func addVideoToNotificationCenterTest(video: LiveVideo) throws {
    let notifications = UserDefaults.standard.data(forKey: UserDefaultKeys.notifications) ?? Data()
    
    let isScheduled = isNotificationScheduledFor(storage: notifications, thisVideo: video)
    
    switch isScheduled {
    case .yes:
        throw NotificationError.invalidDate
    case .no:
        guard let notificationTime = Calendar.current.date(byAdding: .second, value: 5, to: Date()) else {
            throw NotificationError.invalidDate
        }
        
        let dateComponent = Calendar.current.dateComponents([.calendar, .year, .month, .day, .hour, .minute, .second], from: notificationTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        debugPrint(dateComponent)
        
        let content = UNMutableNotificationContent()
        content.title = "Stream from \(video.channel.getTalentName()) starting in 5 minutes"
        content.subtitle = video.channel.name
        content.body = "\(video.channel.getTalentName())'s stream: \(video.title) is starting in 5 minutes."
        
        content.userInfo["agency"] = video.channel.talent?.inGeneration.getGeneration().agency.rawValue
        content.userInfo["id"] = video.id
        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                // Handle error?
            }
        }
    }
}

func cancelNotification(video: LiveVideo) {
    let notifications = UserDefaults.standard.data(forKey: UserDefaultKeys.notifications) ?? Data()
    
    let isScheduled = isNotificationScheduledFor(storage: notifications, thisVideo: video)
    
    switch isScheduled {
    case .yes(let notification):
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [notification.notificationIdentifier.uuidString])
        removeNotificationSchedule(storage: notifications, video: video)
    default:
        return
    }
}

enum IsNotificationScheduled {
    case no
    case yes(LiveVideoNotification)
}

enum NotificationError: LocalizedError {
    case invalidDate
    case alreadyScheduled
    case notificationCenterError
    case cannotDecode(String)
    case cannotEncode(LiveVideoToNotification)
    
    var errorDescription: String? {
        switch self {
        case .invalidDate:
            return "The scheduled notification date was invalid"
        case .alreadyScheduled:
            return "A notification has already been scheduled for this stream."
        case .notificationCenterError:
            return "notification center error"
        case .cannotDecode(let string):
            return "Cannot decode the notification storage from UserDefault, the string is \(string)"
        case .cannotEncode(let liveVideoToNotification):
            return "Cannot encode the notification storage object, the struct is \(liveVideoToNotification)"
        }
    }
}

func isNotificationScheduledFor(@AppStorage(UserDefaultKeys.notifications) storage: Data, thisVideo: LiveVideo) -> IsNotificationScheduled {
    guard let deserialized = try? JSONDecoder().decode(LiveVideoToNotification.self, from: storage) else {
        SentrySDK.capture(error: NotificationError.cannotDecode(String(decoding: storage, as: UTF8.self)) as NSError)
        return .no
    }
    
    if let notification = deserialized[thisVideo] {
        return .yes(notification)
    }
    
    return .no
}

func addToNotificationSchedule(@AppStorage(UserDefaultKeys.notifications) storage: Data, thisVideo: LiveVideo, notificationIdentifier: UUID, minutesBefore: NotificationMinutesBefore, finalNotificationTime: Date) {
    guard var deserialized = try? JSONDecoder().decode(LiveVideoToNotification.self, from: storage) else {
        SentrySDK.capture(error: NotificationError.cannotDecode(String(decoding: storage, as: UTF8.self)) as NSError)
        return
    }
    let copy = storage
    
    let notificationSchedule = LiveVideoNotification(minutesBefore: minutesBefore, finalNotificationTime: finalNotificationTime, notificationIdentifier: notificationIdentifier)
    deserialized[thisVideo] = notificationSchedule
    
    if let serialized = try? JSONEncoder().encode(deserialized) {
        storage = serialized
    } else {
        SentrySDK.capture(error: NotificationError.cannotEncode(deserialized) as NSError)
        storage = copy
    }
}

func removeNotificationSchedule(@AppStorage(UserDefaultKeys.notifications) storage: Data, video: LiveVideo) {
    guard var deserialized = try? JSONDecoder().decode(LiveVideoToNotification.self, from: storage) else {
        SentrySDK.capture(error: NotificationError.cannotDecode(String(decoding: storage, as: UTF8.self)) as NSError)
        return
    }
    let copy = storage
    deserialized.removeValue(forKey: video)
    
    if let serialized = try? JSONEncoder().encode(deserialized) {
        storage = serialized
    } else {
        SentrySDK.capture(error: NotificationError.cannotEncode(deserialized) as NSError)
        storage = copy
    }
}
