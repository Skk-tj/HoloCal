//
//  AppDelegate.swift
//  holo-wtf
//
//
//

import Foundation
import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    @Published var agency: ViewAgency?
    @Published var id: String?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Handles the notification when clicked on
        guard let agency = response.notification.request.content.userInfo["agency"] as? String else {
            completionHandler()
            return
        }
        
        guard let agencyInEnum = AgencyEnum(rawValue: agency) else {
            completionHandler()
            return
        }
        
        guard let viewAgency = agencyToViewAgency[agencyInEnum] else {
            completionHandler()
            return
        }
        
        guard let videoId = response.notification.request.content.userInfo["id"] as? String else {
            completionHandler()
            return
        }
        
        self.agency = viewAgency
        self.id = videoId
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Just show the banner
        completionHandler(UNNotificationPresentationOptions.banner)
    }
}
