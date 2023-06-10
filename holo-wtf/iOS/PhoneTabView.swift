//
//  PhoneTabView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PhoneTabView: View {
    @State var tabSelection: Tabs = .live
    @EnvironmentObject var appDelegate: AppDelegate
    
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
        .onChange(of: appDelegate.id, perform: { _ in
            tabSelection = .upcoming
        })
    }
}

struct PhoneTabView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneTabView()
    }
}
