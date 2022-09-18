//
//  ContentView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct WatchRootView: View {
    var body: some View {
        if #available(watchOS 9.0, *) {
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
        } else {
            NavigationView {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WatchRootView()
    }
}
