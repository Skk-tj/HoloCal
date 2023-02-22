//
//  iPadSplitView.swift
//  holo-wtf
//
//
//

import SwiftUI
import Collections

enum Views: Hashable {
    case live(iPadAgencies)
    case upcoming(iPadAgencies)
    case concerts
    case settings
}

enum iPadAgencies: CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    
    case hololive
    case nijisanji
    case react
    case nanashiInc
    case noriPro
    case favourites
}

let ipadAgenciesToAgency: OrderedDictionary<iPadAgencies, AgencyEnum> = [
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .noriPro: .noriPro
]

struct iPadSplitView: View {
    @State var viewSelection: Views? = Views.live(.hololive)
    @State var columnVis: NavigationSplitViewVisibility = .all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVis) {
            List(selection: $viewSelection) {
                Section(content: {
                    ForEach(ipadAgenciesToAgency.keys) { agency in
                        NavigationLink(value: Views.live(agency)) {
                            SingleAgencyItemView(agency: ipadAgenciesToAgency[agency]!)
                        }
                    }
                    
                    NavigationLink(value: Views.live(.favourites)) {
                        Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                    }
                }, header: {
                    Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                })
                
                Section(content: {
                    ForEach(ipadAgenciesToAgency.keys) { agency in
                        NavigationLink(value: Views.upcoming(agency)) {
                            SingleAgencyItemView(agency: ipadAgenciesToAgency[agency]!)
                        }
                    }
                    
                    NavigationLink(value: Views.upcoming(.favourites)) {
                        Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                    }
                }, header: {
                    Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                })
                
                NavigationLink(value: Views.concerts) {
                    Label("ROOT_VIEW_CONCERTS", systemImage: "music.mic")
                }
                
                NavigationLink(value: Views.settings) {
                    Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("HoloCal")
            .navigationSplitViewColumnWidth(ideal: 230)
        } detail: {
            if let viewSelection {
                // Data driven switch case does not work here for some reason
                switch viewSelection {
                case .live(let agencySelection):
                    switch agencySelection {
                    case .hololive:
                        LiveiPadView(for: .hololive)
                    case .nijisanji:
                        LiveiPadView(for: .nijisanji)
                    case .react:
                        LiveiPadView(for: .react)
                    case .nanashiInc:
                        LiveiPadView(for: .nanashiInc)
                    case .noriPro:
                        LiveiPadView(for: .react)
                    case .favourites:
                        LiveFavouritesiPadView()
                    }
                case .upcoming(let agencySelection):
                    switch agencySelection {
                    case .hololive:
                        UpcomingiPadView(for: .hololive)
                    case .nijisanji:
                        UpcomingiPadView(for: .nijisanji)
                    case .react:
                        UpcomingiPadView(for: .react)
                    case .nanashiInc:
                        UpcomingiPadView(for: .nanashiInc)
                    case .noriPro:
                        UpcomingiPadView(for: .react)
                    case .favourites:
                        UpcomingFavouritesView()
                    }
                case .concerts:
                    NavigationStack {
                        ConcertsView()
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
