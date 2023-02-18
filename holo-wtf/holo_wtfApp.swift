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
    
    @AppStorage("hololiveGenerationListOrder") var hololiveGenerationListOrder = agencyEnumToGenerations[AgencyEnum.hololive]!
    @AppStorage("nijisanjiGenerationListOrder") var nijisanjiGenerationListOrder = agencyEnumToGenerations[AgencyEnum.nijisanji]!
    @AppStorage("reactGenerationListOrder") var reactGenerationListOrder = agencyEnumToGenerations[AgencyEnum.react]!
    @AppStorage("nanashiIncGenerationListOrder") var nanashiIncGenerationListOrder = agencyEnumToGenerations[AgencyEnum.nanashiInc]!
    
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
        
        // When we add generations, we need to handle previous user preferences
        generationSelected = Set(Generation.allCases).subtracting(excludedGenerations)
        
        // Also add the new generation to the order list
        if hololiveGenerationListOrder.count != agencyEnumToGenerations[AgencyEnum.hololive]!.count {
            let difference = Set(agencyEnumToGenerations[AgencyEnum.hololive]!).symmetricDifference(hololiveGenerationListOrder)
            hololiveGenerationListOrder.append(contentsOf: difference)
        }
        
        if nijisanjiGenerationListOrder.count != agencyEnumToGenerations[AgencyEnum.nijisanji]!.count {
            let difference = Set(agencyEnumToGenerations[AgencyEnum.nijisanji]!).symmetricDifference(nijisanjiGenerationListOrder)
            nijisanjiGenerationListOrder.append(contentsOf: difference)
        }
        
        if reactGenerationListOrder.count != agencyEnumToGenerations[AgencyEnum.react]!.count {
            let difference = Set(agencyEnumToGenerations[AgencyEnum.react]!).symmetricDifference(reactGenerationListOrder)
            reactGenerationListOrder.append(contentsOf: difference)
        }
        
        if nanashiIncGenerationListOrder.count != agencyEnumToGenerations[AgencyEnum.nanashiInc]!.count {
            let difference = Set(agencyEnumToGenerations[AgencyEnum.nanashiInc]!).symmetricDifference(nanashiIncGenerationListOrder)
            nanashiIncGenerationListOrder.append(contentsOf: difference)
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
                        AgencySelectionView(viewTitle: "ROOT_VIEW_LIVE", targetView: { agency in
                            LiveView(for: agency)
                        }, extraLinks: {
                            NavigationLink(destination: LiveFavouritesView(), label: {
                                Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                            })
                        })
                    }
                    .tabItem {
                        Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                    }
                    
                    NavigationStack {
                        AgencySelectionView(viewTitle: "ROOT_VIEW_UPCOMING", targetView: { agency in
                            UpcomingView(for: agency)
                        }, extraLinks: {
                            NavigationLink(destination: UpcomingFavouritesView(), label: {
                                Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                            })
                        })
                    }
                    .tabItem() {
                        Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                    }
                    
                    NavigationStack {
                        ConcertsView()
                    }
                    .tabItem() {
                        Label("ROOT_VIEW_CONCERTS", systemImage: "music.mic")
                    }
                    
                    SettingsStackView()
                        .tabItem {
                            Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
                        }
                }
            }
        }
    }
}
