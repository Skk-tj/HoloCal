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
            TabView {
                LiveView()
                    .tabItem {
                        Label("Live", systemImage: "person.wave.2.fill")
                    }
                UpcomingView()
                    .tabItem() {
                        Label("Upcoming", systemImage: "clock")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}
