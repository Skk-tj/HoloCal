//
//  holo_wtfApp.swift
//  holo-wtf
//
//
//

import SwiftUI

@main
struct holo_wtfApp: App {
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
