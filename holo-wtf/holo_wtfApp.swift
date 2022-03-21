//
//  holo_wtfApp.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
//

import SwiftUI

@main
struct holo_wtfApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                LiveView()
                    .tabItem {
                        Label("Live", systemImage: "person.wave.2.fill")
                    }
                UpcomingView()
                    .tabItem() {
                        Label("Upcoming", systemImage: "clock")
                    }
            }
        }
    }
}
