//
//  iPadSplitView.swift
//  holo-wtf
//
//
//

import SwiftUI

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
    @State var viewSelection: Views? = Views.live
    @State var agencySelection: iPadAgencies? = .hololive
    @State var columnVis: NavigationSplitViewVisibility = .all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVis) {
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
            .navigationSplitViewColumnWidth(ideal: 230)
        } content: {
            if let viewSelection {
                switch viewSelection {
                case .live, .upcoming:
                    iPadAgencySelectionView(agencySelection: $agencySelection)
                        .navigationSplitViewColumnWidth(min: 230, ideal: 280, max: 300)
                case .settings:
                    NavigationStack {
                        SettingsiPadView()
                    }
                    .navigationSplitViewColumnWidth(min: 230, ideal: 280, max: 300)
                }
            }
        } detail: {
            if let viewSelection {
                switch viewSelection {
                case .live:
                    if let agencySelection {
                        switch agencySelection {
                        case .hololive:
                            LiveiPadView(for: .hololive)
                        case .nijisanji:
                            LiveiPadView(for: .nijisanji)
                        case .favourites:
                            LiveFavouritesiPadView()
                        }
                    }
                case .upcoming:
                    if let agencySelection {
                        switch agencySelection {
                        case .hololive:
                            UpcomingiPadView(for: .hololive)
                        case .nijisanji:
                            UpcomingiPadView(for: .nijisanji)
                        case .favourites:
                            UpcomingFavouritesiPadView()
                        }
                    }
                case .settings:
                    NavigationStack {
                        EmptyView()
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
