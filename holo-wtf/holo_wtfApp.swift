//
//  holo_wtfApp.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
//

import SwiftUI

enum Views {
    case live
    case upcoming
    case settings
}

@main
struct holo_wtfApp: App {
    @AppStorage(UserDefaultKeys.dstDays) var dstDays: Int = 5
    @AppStorage(UserDefaultKeys.isShowingDSTReminder) var isShowingDSTReminder = false
    
    @AppStorage("generationListSelection") var generationSelected = Set(GenerationEnum.allCases)
    @AppStorage("generationListOrder") var generationOrder = GenerationEnum.allCases
    @AppStorage("excludedGenerations") var excludedGenerations = Set<GenerationEnum>()
    
    @State var viewSelection: Views? = Views.live
    
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
                // TODO: https://stackoverflow.com/questions/73279601/swiftui-navigationstack-inside-navigationsplitview-not-working-on-iphone-and-ipa
                if #available(iOS 16.0, *) {
                    NavigationSplitView(sidebar: {
                        List(selection: $viewSelection) {
                            NavigationLink(value: Views.live) {
                                Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                            }
                            NavigationLink(value: Views.upcoming) {
                                Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                            }
                            NavigationLink(value: Views.settings) {
                                Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
                            }
                        }
                        .listStyle(.sidebar)
                        .navigationTitle("HoloCal")
                    }, detail: {
                        NavigationStack {
                            if let viewSelection {
                                switch viewSelection {
                                case Views.live:
                                    LiveiPadView()
                                case Views.upcoming:
                                    UpcomingiPadView()
                                case Views.settings:
                                    SettingsiPadView()
                                }
                            }
                        }
                    })
                } else {
                    NavigationView {
                        iPadSidebarView()
                        LiveiPadView()
                    }
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
