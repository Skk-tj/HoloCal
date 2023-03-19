//
//  ContentView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct WatchRootView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink(value: Tabs.live) {
                    Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                }
                
                NavigationLink(value: Tabs.upcoming) {
                    Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                }
                
                NavigationLink(value: Tabs.past) {
                    Label("ROOT_VIEW_PAST", systemImage: "clock.arrow.circlepath")
                }
                
                NavigationLink(value: Tabs.concerts) {
                    Label("ROOT_VIEW_CONCERTS", systemImage: "music.mic")
                }
                
                NavigationLink(value: Tabs.settings) {
                    Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
                }
            }
            .navigationTitle("HoloCal")
            .navigationDestination(for: Tabs.self) { tab in
                switch tab {
                case .live:
                    AgencyNavigationView(viewTitle: "ROOT_VIEW_LIVE") { agency in
                        LiveWatchView(for: agency)
                    } favouritesView: {
                        LiveFavouritesWatchView()
                    }
                case .upcoming:
                    AgencyNavigationView(viewTitle: "ROOT_VIEW_UPCOMING") { agency in
                        UpcomingWatchView(for: agency)
                    } favouritesView: {
                        UpcomingFavouritesWatchView()
                    }
                case .past:
                    AgencyNavigationView(viewTitle: "ROOT_VIEW_PAST") { agency in
                        PastWatchView(for: agency)
                    } favouritesView: {
                        PastFavouritesWatchView()
                    }
                case .concerts:
                    ConcertsWatchView()
                case .settings:
                    SettingsWatchView()
                }
            }
            .onOpenURL { url in
                guard url.scheme == "holocal" else { return }
                guard url.host == "widget-launch" else { return }
                guard url.pathComponents.count == 3 else { return }
                
                let view = WidgetDeepLinkView(rawValue: url.pathComponents[1])
                
                guard let unwrappedView = view else { return }
                path = NavigationPath()
                
                switch unwrappedView {
                case .live:
                    path.append(Tabs.live)
                case .upcoming:
                    path.append(Tabs.upcoming)
                case .past:
                    path.append(Tabs.past)
                case .concerts:
                    path.append(Tabs.concerts)
                case .settings:
                    path.append(Tabs.settings)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WatchRootView()
    }
}
