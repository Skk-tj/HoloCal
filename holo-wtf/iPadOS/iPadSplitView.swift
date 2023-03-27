//
//  iPadSplitView.swift
//  holo-wtf
//
//
//

import SwiftUI
import Collections

enum Views: Hashable {
    case live(ViewAgency)
    case upcoming(ViewAgency)
    case past(ViewAgency)
    case concerts
    case settings
}

struct iPadSplitView: View {
    @State var viewSelection: Views? = Views.live(.hololive)
    
    var body: some View {
        NavigationSplitView {
            List(selection: $viewSelection) {
                Section {
                    ForEach(viewAgencyToAgency.keys) { agency in
                        NavigationLink(value: Views.live(agency)) {
                            SingleAgencyItemView(agency: viewAgencyToAgency[agency]!)
                        }
                    }

                    NavigationLink(value: Views.live(.favourites)) {
                        Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                    }
                } header: {
                    Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                }

                Section {
                    ForEach(viewAgencyToAgency.keys) { agency in
                        NavigationLink(value: Views.upcoming(agency)) {
                            SingleAgencyItemView(agency: viewAgencyToAgency[agency]!)
                        }
                    }

                    NavigationLink(value: Views.upcoming(.favourites)) {
                        Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                    }
                } header: {
                    Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                }

                Section {
                    ForEach(viewAgencyToAgency.keys) { agency in
                        NavigationLink(value: Views.past(agency)) {
                            SingleAgencyItemView(agency: viewAgencyToAgency[agency]!)
                        }
                    }

                    NavigationLink(value: Views.past(.favourites)) {
                        Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                    }
                } header: {
                    Label("ROOT_VIEW_PAST", systemImage: "clock.arrow.circlepath")
                }
                
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
                        LiveiPadView(for: .noriPro)
                    case .vspo:
                        LiveiPadView(for: .vspo)
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
                        UpcomingiPadView(for: .noriPro)
                    case .vspo:
                        UpcomingiPadView(for: .vspo)
                    case .favourites:
                        UpcomingFavouritesiPadView()
                    }
                case .past(let agencySelection):
                    switch agencySelection {
                    case .hololive:
                        PastiPadView(for: .hololive)
                    case .nijisanji:
                        PastiPadView(for: .nijisanji)
                    case .react:
                        PastiPadView(for: .react)
                    case .nanashiInc:
                        PastiPadView(for: .nanashiInc)
                    case .noriPro:
                        PastiPadView(for: .noriPro)
                    case .vspo:
                        PastiPadView(for: .vspo)
                    case .favourites:
                        PastFavouritesiPadView()
                    }
                case .concerts:
                    NavigationStack {
                        ConcertsView()
                    }
                case .settings:
                    NavigationStack {
                        SettingsFormView()
                    }
                }
            }
        }
        .onOpenURL { url in
            guard let unwrappedView = widgetDeepLinkUrlParseView(url: url) else { return }
            
            switch unwrappedView {
            case .live:
                if let viewAgency = widgetDeepLinkUrlParseAgency(url: url) {
                    viewSelection = .live(viewAgency)
                } else {
                    viewSelection = .live(.hololive)
                }
            case .upcoming:
                if let viewAgency = widgetDeepLinkUrlParseAgency(url: url) {
                    viewSelection = .upcoming(viewAgency)
                } else {
                    viewSelection = .upcoming(.hololive)
                }
            case .past:
                if let viewAgency = widgetDeepLinkUrlParseAgency(url: url) {
                    viewSelection = .past(viewAgency)
                } else {
                    viewSelection = .past(.hololive)
                }
            case .concerts:
                viewSelection = .concerts
            case .settings:
                viewSelection = .settings
            }
        }
    }
}

struct iPadSplitView_Previews: PreviewProvider {
    static var previews: some View {
        iPadSplitView()
    }
}
