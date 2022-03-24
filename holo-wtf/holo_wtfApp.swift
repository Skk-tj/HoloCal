//
//  holo_wtfApp.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
//

import SwiftUI

@main
struct holo_wtfApp: App {
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.userInterfaceIdiom == .pad {
                // iPadOS
                NavigationView {
                    List {
                        NavigationLink(destination: LiveiPadView()) {
                            Label("Live", systemImage: "person.wave.2.fill")
                        }
                        NavigationLink(destination: UpcomingiPadView()) {
                            Label("Upcoming", systemImage: "clock")
                        }
                        NavigationLink(destination: SettingsiPadView()) {
                            Label("Settings", systemImage: "gear")
                        }
                    }
                    .listStyle(SidebarListStyle())
                    .navigationTitle("HoloCal")
                    
                    LiveiPadView()
                }
            } else {
                // iOS
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
}
