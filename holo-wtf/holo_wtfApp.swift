//
//  holo_wtfApp.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
//

import SwiftUI

@main
struct holo_wtfApp: App {
    @AppStorage(UserDefaultKeys.dstDays) var dstDays: Int = 5
    @AppStorage(UserDefaultKeys.isShowingDSTReminder) var isShowingDSTReminder = false
    
    @AppStorage("generationListSelection") var generationSelected = Set(Generation.allCases)
    @AppStorage("generationListOrder") var generationOrder = Generation.allCases
    @AppStorage("excludedGenerations") var excludedGenerations = Set<Generation>()
    
    init() {
        // MARK: - Setup DST Warning
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
        
        // MARK: - When we add generations, we need to handle previous user preferences
        generationSelected = Set(Generation.allCases).subtracting(excludedGenerations)
        
        // MARK: - Also add the new generation to the order list
        if generationOrder.count != Generation.allCases.count {
            let difference = Set(Generation.allCases).symmetricDifference(generationOrder)
            generationOrder.append(contentsOf: difference)
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
                    if #available(iOS 16.0, *) {
                        LiveStackView()
                            .tabItem {
                                Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                            }
                        UpcomingStackView()
                            .tabItem() {
                                Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                            }
                        SettingsStackView()
                            .tabItem {
                                Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
                            }
                    } else {
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
}
