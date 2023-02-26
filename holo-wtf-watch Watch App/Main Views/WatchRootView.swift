//
//  ContentView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct WatchRootView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: {
                    AgencySelectionView(viewTitle: "ROOT_VIEW_LIVE", targetView: { agency in
                        LiveWatchView(for: agency)
                    }, extraLinks: {
                        NavigationLink(destination: LiveFavouritesWatchView(), label: {
                            Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                        })
                    })
                }, label: {
                    Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                })
                
                NavigationLink(destination: {
                    AgencySelectionView(viewTitle: "ROOT_VIEW_UPCOMING", targetView: { agency in
                        UpcomingWatchView(for: agency)
                    }, extraLinks: {
                        NavigationLink(destination: UpcomingFavouritesWatchView(), label: {
                            Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                        })
                    })
                }, label: {
                    Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                })
                
                NavigationLink(destination: {
                    AgencySelectionView(viewTitle: "ROOT_VIEW_PAST", targetView: { agency in
                        PastWatchView(for: agency)
                    }, extraLinks: {
                        NavigationLink(destination: PastFavouritesWatchView(), label: {
                            Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
                        })
                    })
                }, label: {
                    Label("ROOT_VIEW_PAST", systemImage: "clock.arrow.circlepath")
                })
                
                NavigationLink(destination: {
                    ConcertsWatchView()
                }, label: {
                    Label("ROOT_VIEW_CONCERTS", systemImage: "music.mic")
                })
                
                NavigationLink(destination: {
                    SettingsWatchView()
                }, label: {
                    Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
                })
            }
            .navigationTitle("HoloCal")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WatchRootView()
    }
}
