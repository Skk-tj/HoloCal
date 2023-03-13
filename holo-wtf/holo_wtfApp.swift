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
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    @AppStorage("generationListSelection") var generationSelected = Set(Generation.allCases)
    @AppStorage("excludedGenerations") var excludedGenerations = Set<Generation>()
    
    @AppStorage("generationListOrderNew") var generateListOrder: Data = try! JSONEncoder().encode(agencyEnumToGenerations)
    
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
        
        // MARK: - Migrate displayed generation
        // When we add generations, we need to handle previous user preferences
        generationSelected = Set(Generation.allCases).subtracting(excludedGenerations)
        
        // MARK: - Migrate generation order
        // Also add the new generation to the order list
        for agency in AgencyEnum.allCases {
            let defaultGenerationOrder = agencyEnumToGenerations[agency]!
            let userSavedGenerationOrder = getGenerationOrderList(from: generateListOrder, agency: agency)
            
            if userSavedGenerationOrder.count != defaultGenerationOrder.count {
                let difference = Set(defaultGenerationOrder).symmetricDifference(userSavedGenerationOrder)
                appendNewGenerationOrderList(to: generateListOrder, order: difference, agency: agency)
            }
        }
        
        // Get user favourites from iCloud
        let keyStore = NSUbiquitousKeyValueStore()
        if let cloudFavouriteChannel = keyStore.array(forKey: UserDefaultKeys.favouritedChannel) {
            if let converted = cloudFavouriteChannel as? [String] {
                let localSet: Set<String> = Set(favourited)
                let merged = localSet.union(converted)
                favourited = Array(merged)
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.userInterfaceIdiom == .pad {
                // iPadOS
                iPadSplitView()
            } else {
                // iOS
                TabView {
                    NavigationStack {
                        AgencyNavigationView(viewTitle: "ROOT_VIEW_LIVE") { agency in
                            LiveView(for: agency)
                        }
                    }
                    .tabItem {
                        Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                    }
                    
                    NavigationStack {
                        AgencyNavigationView(viewTitle: "ROOT_VIEW_UPCOMING") { agency in
                            UpcomingView(for: agency)
                        }
                    }
                    .tabItem {
                        Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                    }
                    
                    NavigationStack {
                        AgencyNavigationView(viewTitle: "ROOT_VIEW_PAST") { agency in
                            PastView(for: agency)
                        }
                    }
                    .tabItem {
                        Label("ROOT_VIEW_PAST", systemImage: "clock.arrow.circlepath")
                    }
                    
                    NavigationStack {
                        ConcertsView()
                    }
                    .tabItem() {
                        Label("ROOT_VIEW_CONCERTS", systemImage: "music.mic")
                    }
                    
                    NavigationStack {
                        SettingsFormView()
                    }
                    .tabItem {
                        Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
                    }
                }
            }
        }
    }
}
