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
                    LiveWatchView()
                }, label: {
                    Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                })
                
                NavigationLink(destination: {
                    UpcomingWatchView()
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
