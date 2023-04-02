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
                        VideoTabletView(for: .hololive, videoType: .live)
                    case .nijisanji:
                        VideoTabletView(for: .nijisanji, videoType: .live)
                    case .react:
                        VideoTabletView(for: .react, videoType: .live)
                    case .nanashiInc:
                        VideoTabletView(for: .nanashiInc, videoType: .live)
                    case .noriPro:
                        VideoTabletView(for: .noriPro, videoType: .live)
                    case .vspo:
                        VideoTabletView(for: .vspo, videoType: .live)
                    case .favourites:
                        LiveFavouritesTabletView()
                    }
                case .upcoming(let agencySelection):
                    switch agencySelection {
                    case .hololive:
                        VideoTabletView(for: .hololive, videoType: .upcoming)
                    case .nijisanji:
                        VideoTabletView(for: .nijisanji, videoType: .upcoming)
                    case .react:
                        VideoTabletView(for: .react, videoType: .upcoming)
                    case .nanashiInc:
                        VideoTabletView(for: .nanashiInc, videoType: .upcoming)
                    case .noriPro:
                        VideoTabletView(for: .noriPro, videoType: .upcoming)
                    case .vspo:
                        VideoTabletView(for: .vspo, videoType: .upcoming)
                    case .favourites:
                        UpcomingFavouritesTabletView()
                    }
                case .past(let agencySelection):
                    switch agencySelection {
                    case .hololive:
                        VideoTabletView(for: .hololive, videoType: .past)
                    case .nijisanji:
                        VideoTabletView(for: .nijisanji, videoType: .past)
                    case .react:
                        VideoTabletView(for: .react, videoType: .past)
                    case .nanashiInc:
                        VideoTabletView(for: .nanashiInc, videoType: .past)
                    case .noriPro:
                        VideoTabletView(for: .noriPro, videoType: .past)
                    case .vspo:
                        VideoTabletView(for: .vspo, videoType: .past)
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
