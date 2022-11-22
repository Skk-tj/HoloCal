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
    
    @AppStorage("generationListSelection") var generationSelected = Set(Generation.allCases)
    @AppStorage("excludedGenerations") var excludedGenerations = Set<Generation>()
    
    @AppStorage("hololiveGenerationListOrder") var hololiveGenerationListOrder = agencyEnumToGenerations[AgencyEnum.hololive]!
    @AppStorage("nijisanjiGenerationListOrder") var nijisanjiGenerationListOrder = agencyEnumToGenerations[AgencyEnum.nijisanji]!
    
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
                        NavigationStack {
                            AgencySelectionView(viewTitle: "ROOT_VIEW_LIVE", targetView: { agency in
                                LiveView(for: agency)
                            }, extraLinks: {
                                NavigationLink(destination: LiveFavouritesView(), label: {
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.accentColor)
                                        Text("ROOT_VIEW_FAVOURITES")
                                    }
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
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.accentColor)
                                        Text("ROOT_VIEW_FAVOURITES")
                                    }
                                })
                            })
                        }
                        .tabItem() {
                            Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                        }
                        
                        SettingsStackView()
                            .tabItem {
                                Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
                            }
                    } else {
                        NavigationView {
                            AgencySelectionView(viewTitle: "ROOT_VIEW_LIVE", targetView: { agency in
                                LiveView(for: agency)
                            }, extraLinks: {
                                NavigationLink(destination: LiveFavouritesView(), label: {
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.accentColor)
                                        Text("ROOT_VIEW_FAVOURITES")
                                    }
                                })
                            })
                        }
                        .tabItem {
                            Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                        }
                        
                        NavigationView {
                            AgencySelectionView(viewTitle: "ROOT_VIEW_UPCOMING", targetView: { agency in
                                UpcomingView(for: agency)
                            }, extraLinks: {
                                NavigationLink(destination: UpcomingFavouritesView(), label: {
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.accentColor)
                                        Text("ROOT_VIEW_FAVOURITES")
                                    }
                                })
                            })
                        }
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
