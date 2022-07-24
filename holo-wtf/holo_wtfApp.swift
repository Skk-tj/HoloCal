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
    
    @AppStorage("generationListSelection") var generationSelected = Set(GenerationEnum.allCases)
    @AppStorage("generationListOrder") var generationOrder = GenerationEnum.allCases
    @AppStorage("excludedGenerations") var excludedGenerations = Set<GenerationEnum>()
    
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
        generationSelected = Set(GenerationEnum.allCases).subtracting(excludedGenerations)
        
        // MARK: - Also add the new generation to the order list
        if generationOrder.count != GenerationEnum.allCases.count {
            let difference = Set(GenerationEnum.allCases).symmetricDifference(generationOrder)
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
