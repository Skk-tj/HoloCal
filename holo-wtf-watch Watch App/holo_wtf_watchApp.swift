//
//  holo_wtf_watchApp.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

@main
struct holo_wtf_watch_Watch_AppApp: App {
    @AppStorage(UserDefaultKeys.favouritedChannel) var favourited = Favourited()
    
    init() {
        let keyStore = NSUbiquitousKeyValueStore()
        if let cloudFavouriteChannel = keyStore.array(forKey: UserDefaultKeys.favouritedChannel) {
            print(cloudFavouriteChannel)
            if let converted = cloudFavouriteChannel as? [String] {
                favourited = converted
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            WatchRootView()
        }
    }
}
