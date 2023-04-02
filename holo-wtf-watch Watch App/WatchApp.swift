//
//  holo_wtf_watchApp.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

@main
struct WatchApp: App {
    @AppStorage(UserDefaultKeys.favouritedChannel) var favourited = Favourited()
    
    init() {
        // MARK: - Get user favourites from iCloud
        let keyStore = NSUbiquitousKeyValueStore()
        if let cloudFavouriteChannel = keyStore.array(forKey: UserDefaultKeys.favouritedChannel) {
            if let converted = cloudFavouriteChannel as? [String] {
                let localSet: Set<String> = Set(favourited)
                let merged = localSet.union(converted)
                favourited = Array(merged)
            }
        }
        
        // MARK: - Clean up orphaned favourites
        var toRemove: [String] = []
        for favourite in favourited where TalentEnum(rawValue: favourite) == nil {
            toRemove.append(favourite)
        }
        
        favourited.removeAll { favourite in
            toRemove.contains(where: { $0 == favourite })
        }
    }
    
    var body: some Scene {
        WindowGroup {
            WatchRootView()
        }
    }
}
