//
//  iPadSplitView.swift
//  holo-wtf
//
//
//

import SwiftUI

enum Views: Hashable {
    case live(iPadAgencies)
    case upcoming(iPadAgencies)
    case settings
}

enum iPadAgencies {
    case hololive
    case nijisanji
    case favourites
}

struct iPadAgencySelectionView: View {
    @Binding var agencySelection: iPadAgencies?
    
    var body: some View {
        List(selection: $agencySelection) {
            NavigationLink(value: iPadAgencies.hololive) {
                SingleAgencyItemView(agency: .hololive)
            }
            
            NavigationLink(value: iPadAgencies.nijisanji) {
                SingleAgencyItemView(agency: .nijisanji)
            }
            
            NavigationLink(value: iPadAgencies.favourites) {
                Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
            }
        }
        .listStyle(.sidebar)
        .navigationTitle(LocalizedStringKey("SETTINGS_SELECT_AGENCY_NAVIGATION_TITLE"))
    }
}

struct iPadSplitView: View {
    @State var viewSelection: Views? = Views.live(.hololive)
    @State var columnVis: NavigationSplitViewVisibility = .all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVis) {
            List(selection: $viewSelection) {
                Section(content: {
                    NavigationLink(value: Views.live(.hololive)) {
                        SingleAgencyItemView(agency: .hololive)
                    }
                    
                    NavigationLink(value: Views.live(.nijisanji)) {
                        SingleAgencyItemView(agency: .nijisanji)
                    }
                    
                    NavigationLink(value: Views.live(.favourites)) {
                        Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                    }
                }, header: {
                    Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                })
                
                Section(content: {
                    NavigationLink(value: Views.upcoming(.hololive)) {
                        SingleAgencyItemView(agency: .hololive)
                    }
                    
                    NavigationLink(value: Views.upcoming(.nijisanji)) {
                        SingleAgencyItemView(agency: .nijisanji)
                    }
                    
                    NavigationLink(value: Views.upcoming(.favourites)) {
                        Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                    }
                }, header: {
                    Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                })
                
                NavigationLink(value: Views.settings) {
                    Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("HoloCal")
            .navigationSplitViewColumnWidth(ideal: 230)
        } detail: {
            if let viewSelection {
                switch viewSelection {
                case .live(let agencySelection):
                    switch agencySelection {
                    case .hololive:
                        LiveiPadView(for: .hololive)
                    case .nijisanji:
                        LiveiPadView(for: .nijisanji)
                    case .favourites:
                        LiveFavouritesiPadView()
                    }
                case .upcoming(let agencySelection):
                    switch agencySelection {
                    case .hololive:
                        UpcomingiPadView(for: .hololive)
                    case .nijisanji:
                        UpcomingiPadView(for: .nijisanji)
                    case .favourites:
                        UpcomingFavouritesiPadView()
                    }
                case .settings:
                    NavigationStack {
                        SettingsiPadView()
                    }
                }
            }
        }
    }
}

struct iPadSplitView_Previews: PreviewProvider {
    static var previews: some View {
        iPadSplitView()
    }
}
