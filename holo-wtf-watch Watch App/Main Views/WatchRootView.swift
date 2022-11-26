//
//  ContentView.swift
//  holo-wtf-watch Watch App
//
//  Created by Haoyi An on 2022-09-18.
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
