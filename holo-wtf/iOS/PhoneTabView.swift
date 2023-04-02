//
//  PhoneTabView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoStackView: View {
    @State var path = NavigationPath()
    let videoType: VideoType
    
    var body: some View {
        NavigationStack(path: $path) {
            AgencyNavigationView(viewTitle: videoTypeToViewTitleAndIcon[videoType]!.0) { agency in
                switch videoType {
                case .live:
                    LiveView(for: agency)
                case .upcoming:
                    UpcomingView(for: agency)
                case .past:
                    PastView(for: agency)
                }
            } favouritesView: {
                switch videoType {
                case .live:
                    LiveFavouritesView()
                case .upcoming:
                    UpcomingFavouritesView()
                case .past:
                    PastFavouritesView()
                }
            }
            .onOpenURL { url in
                guard let unwrappedAgency = widgetDeepLinkUrlParseAgency(url: url) else { return }
                path.append(unwrappedAgency)
            }
        }
    }
}

struct PhoneTabView: View {
    @State var tabSelection: Tabs = .live
    
    var body: some View {
        TabView(selection: $tabSelection) {
            VideoStackView(videoType: .live)
                .tabItem {
                    Label(NSLocalizedString(videoTypeToViewTitleAndIcon[.live]!.0, comment: ""), systemImage: videoTypeToViewTitleAndIcon[.live]!.1)
                }
                .tag(Tabs.live)
            
            VideoStackView(videoType: .upcoming)
                .tabItem {
                    Label(NSLocalizedString(videoTypeToViewTitleAndIcon[.upcoming]!.0, comment: ""), systemImage: videoTypeToViewTitleAndIcon[.upcoming]!.1)
                }
                .tag(Tabs.upcoming)
            
            VideoStackView(videoType: .past)
                .tabItem {
                    Label(NSLocalizedString(videoTypeToViewTitleAndIcon[.past]!.0, comment: ""), systemImage: videoTypeToViewTitleAndIcon[.past]!.1)
                }
                .tag(Tabs.past)
            
            NavigationStack {
                ConcertsView()
            }
            .tabItem {
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
            guard let unwrappedView = widgetDeepLinkUrlParseView(url: url) else { return }
            tabSelection = unwrappedView
        }
    }
}

struct PhoneTabView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneTabView()
    }
}
