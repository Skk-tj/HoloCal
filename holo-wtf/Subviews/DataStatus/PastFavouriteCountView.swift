//
//  PastFavouriteCountView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastFavouriteCountView: View {
    @AppStorage var favourited: Favourited
    
    @EnvironmentObject var past: VideoViewModel
    
    init(userDefaultSuite: String? = "group.io.skk-tj.holo-wtf.ios") {
        if let userDefaultSuite {
            self._favourited = AppStorage(wrappedValue: Favourited(), UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: userDefaultSuite))
        } else {
            self._favourited = AppStorage(wrappedValue: Favourited(), UserDefaultKeys.favouritedChannel)
        }
    }
    
    var body: some View {
        let filteredVideoCount = past.videoList.filter { video in
            favourited.contains(video.channel.id)
        }.count
        
        Text("PAST_VIEW_CURRENT_COUNT \(filteredVideoCount)")
            .foregroundColor(.secondary)
    }
}

struct PastFavouriteCountView_Previews: PreviewProvider {
    static var previews: some View {
        PastFavouriteCountView()
    }
}
