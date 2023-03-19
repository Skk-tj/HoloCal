//
//  iOSTabView.swift
//  holo-wtf
//
// 
//

import SwiftUI

struct iOSTabView: View {
    @State var tabSelection: Tabs = .live
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationStack {
                AgencyNavigationView(viewTitle: "ROOT_VIEW_LIVE") { agency in
                    LiveView(for: agency)
                } favouritesView: {
                    LiveFavouritesView()
                }
            }
            .tabItem {
                Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
            }
            .tag(Tabs.live)
            
            NavigationStack {
                AgencyNavigationView(viewTitle: "ROOT_VIEW_UPCOMING") { agency in
                    UpcomingView(for: agency)
                } favouritesView: {
                    UpcomingFavouritesView()
                }
            }
            .tabItem {
                Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
            }
            .tag(Tabs.upcoming)
            
            NavigationStack {
                AgencyNavigationView(viewTitle: "ROOT_VIEW_PAST") { agency in
                    PastView(for: agency)
                } favouritesView: {
                    PastFavouritesView()
                }
            }
            .tabItem {
                Label("ROOT_VIEW_PAST", systemImage: "clock.arrow.circlepath")
            }
            .tag(Tabs.past)
            
            NavigationStack {
                ConcertsView()
            }
            .tabItem() {
                Label("ROOT_VIEW_CONCERTS", systemImage: "music.mic")
            }
            .tag(Tabs.concerts)
            
            NavigationStack {
                SettingsFormView()
            }
            .tabItem {
                Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
            }
            .tag(Tabs.settings)
        }
        .onOpenURL { url in
            guard url.scheme == "holocal" else { return }
            guard url.host == "widget-launch" else { return }
            guard url.pathComponents.count == 3 else { return }
            
            let view = WidgetDeepLinkView(rawValue: url.pathComponents[1])
            
            guard let unwrappedView = view else { return }
            
            switch unwrappedView {
            case .live:
                tabSelection = .live
            case .upcoming:
                tabSelection = .upcoming
            case .past:
                tabSelection = .past
            case .concerts:
                tabSelection = .concerts
            case .settings:
                tabSelection = .settings
            }
        }
    }
}

struct iOSTabView_Previews: PreviewProvider {
    static var previews: some View {
        iOSTabView()
    }
}
