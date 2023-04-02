//
//  TabletSplitView.swift
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

struct TabletSplitView: View {
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
                        LiveTabletView(for: .hololive)
                    case .nijisanji:
                        LiveTabletView(for: .nijisanji)
                    case .react:
                        LiveTabletView(for: .react)
                    case .nanashiInc:
                        LiveTabletView(for: .nanashiInc)
                    case .noriPro:
                        LiveTabletView(for: .noriPro)
                    case .vspo:
                        LiveTabletView(for: .vspo)
                    case .favourites:
                        LiveFavouritesTabletView()
                    }
                case .upcoming(let agencySelection):
                    switch agencySelection {
                    case .hololive:
                        UpcomingTabletView(for: .hololive)
                    case .nijisanji:
                        UpcomingTabletView(for: .nijisanji)
                    case .react:
                        UpcomingTabletView(for: .react)
                    case .nanashiInc:
                        UpcomingTabletView(for: .nanashiInc)
                    case .noriPro:
                        UpcomingTabletView(for: .noriPro)
                    case .vspo:
                        UpcomingTabletView(for: .vspo)
                    case .favourites:
                        UpcomingFavouritesTabletView()
                    }
                case .past(let agencySelection):
                    switch agencySelection {
                    case .hololive:
                        PastTabletView(for: .hololive)
                    case .nijisanji:
                        PastTabletView(for: .nijisanji)
                    case .react:
                        PastTabletView(for: .react)
                    case .nanashiInc:
                        PastTabletView(for: .nanashiInc)
                    case .noriPro:
                        PastTabletView(for: .noriPro)
                    case .vspo:
                        PastTabletView(for: .vspo)
                    case .favourites:
                        PastFavouritesTabletView()
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

struct TabletSplitView_Previews: PreviewProvider {
    static var previews: some View {
        TabletSplitView()
    }
}
