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
    case concerts
    case settings
}

enum iPadAgencies: CaseIterable {
    case hololive
    case nijisanji
    case react
    case nanashiInc
    case favourites
}

let ipadAgenciesToAgency: [iPadAgencies: AgencyEnum] = [
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc
]

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
                    
                    NavigationLink(value: Views.live(.react)) {
                        SingleAgencyItemView(agency: .react)
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
                    
                    NavigationLink(value: Views.upcoming(.react)) {
                        SingleAgencyItemView(agency: .react)
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
                switch viewSelection {
                case .live(let agencySelection):
                    switch agencySelection {
                    case .favourites:
                        LiveFavouritesiPadView()
                    default:
                        LiveiPadView(for: ipadAgenciesToAgency[agencySelection]!)
                    }
                case .upcoming(let agencySelection):
                    switch agencySelection {
                    case .favourites:
                        UpcomingFavouritesiPadView()
                    default:
                        UpcomingiPadView(for: ipadAgenciesToAgency[agencySelection]!)
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
