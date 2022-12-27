//
//  LiveFavouriteCountView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveFavouriteCountView: View {
    @AppStorage var favourited: Favourited
    
    @EnvironmentObject var live: VideoViewModel
    
    init(userDefaultSuite: String? = "group.io.skk-tj.holo-wtf.ios") {
        if let userDefaultSuite {
            self._favourited = AppStorage(wrappedValue: Favourited(), UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: userDefaultSuite))
        } else {
            self._favourited = AppStorage(wrappedValue: Favourited(), UserDefaultKeys.favouritedChannel)
        }
    }
    
    var body: some View {
        let filteredVideoCount = live.videoList.filter { video in
            favourited.contains(video.channel.id)
        }.count
        
        Text("LIVE_VIEW_CURRENT_COUNT \(filteredVideoCount)")
            .foregroundColor(.secondary)
    }
}

struct LiveFavouriteCountView_Previews: PreviewProvider {
    static var previews: some View {
        LiveFavouriteCountView()
    }
}
