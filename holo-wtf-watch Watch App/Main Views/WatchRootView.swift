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
                    if #available(watchOS 10.0, *) {
                        AgencyNavigationView(viewTitle: "ROOT_VIEW_LIVE") { agency in
                            VideoWatchView(for: agency, videoType: .live)
                        } favouritesView: {
                            VideoFavouritesWatchView(videoType: .live)
                        }
                        .containerBackground(Color.red.gradient, for: .navigation)
                    } else {
                        AgencyNavigationView(viewTitle: "ROOT_VIEW_LIVE") { agency in
                            VideoWatchView(for: agency, videoType: .live)
                        } favouritesView: {
                            VideoFavouritesWatchView(videoType: .live)
                        }
                    }
                case .upcoming:
                    if #available(watchOS 10.0, *) {
                        AgencyNavigationView(viewTitle: "ROOT_VIEW_UPCOMING") { agency in
                            VideoWatchView(for: agency, videoType: .upcoming)
                        } favouritesView: {
                            VideoFavouritesWatchView(videoType: .upcoming)
                        }
                        .containerBackground(Color.pink.gradient, for: .navigation)
                    } else {
                        AgencyNavigationView(viewTitle: "ROOT_VIEW_UPCOMING") { agency in
                            VideoWatchView(for: agency, videoType: .upcoming)
                        } favouritesView: {
                            VideoFavouritesWatchView(videoType: .upcoming)
                        }
                    }
                case .past:
                    if #available(watchOS 10.0, *) {
                        AgencyNavigationView(viewTitle: "ROOT_VIEW_PAST") { agency in
                            VideoWatchView(for: agency, videoType: .past)
                        } favouritesView: {
                            VideoFavouritesWatchView(videoType: .past)
                        }
                        .containerBackground(Color.blue.gradient, for: .navigation)
                    } else {
                        AgencyNavigationView(viewTitle: "ROOT_VIEW_PAST") { agency in
                            VideoWatchView(for: agency, videoType: .past)
                        } favouritesView: {
                            VideoFavouritesWatchView(videoType: .past)
                        }
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
                path.append(unwrappedAgency)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WatchRootView()
    }
}
