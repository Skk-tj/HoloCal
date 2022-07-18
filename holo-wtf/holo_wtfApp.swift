//
//  holo_wtfApp.swift
//  holo-wtf
//
//
//

import SwiftUI

@main
struct holo_wtfApp: App {
    @AppStorage(UserDefaultKeys.dstDays) var dstDays: Int = 5
    @AppStorage(UserDefaultKeys.isShowingDSTReminder) var isShowingDSTReminder = false
    
    init() {
        let tz = TimeZone.current
        
        if let nextDSTTransition = tz.nextDaylightSavingTimeTransition {
            if let days = Calendar.current.dateComponents([.day], from: Date(), to: nextDSTTransition).day {
                if days <= dstDays {
                    isShowingDSTReminder = true
                } else {
                    isShowingDSTReminder = false
                }
            }
        } else {
            isShowingDSTReminder = false
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.userInterfaceIdiom == .pad {
                // iPadOS
                NavigationView {
                    iPadSidebarView()
                    LiveiPadView()
                }
            } else {
                // iOS
                TabView {
                    LiveView()
                        .tabItem {
                            Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                        }
                    UpcomingView()
                        .tabItem() {
                            Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                        }
                    SettingsView()
                        .tabItem {
                            Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
                        }
                }
            }
        }
    }
}
