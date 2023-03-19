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
                guard let unwrappedView = widgetDeepLinkUrlParseView(url: url) else { return }
                path = NavigationPath()
                path.append(unwrappedView)
                
                guard let unwrappedAgency = widgetDeepLinkUrlParseAgency(url: url) else { return }
                if let viewAgency = widgetDeepLinkToViewAgency[unwrappedAgency] {
                    path.append(viewAgency)
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
