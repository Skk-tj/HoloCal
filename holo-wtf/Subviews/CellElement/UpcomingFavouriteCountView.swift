//
//  UpcomingFavouriteCountView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingFavouriteCountView: View {
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var upcomingLookAhead = 48
    @AppStorage var favourited: Favourited
    
    @EnvironmentObject var upcoming: VideoViewModel
    
    init(userDefaultSuite: String? = "group.io.skk-tj.holo-wtf.ios") {
        if let userDefaultSuite {
            self._favourited = AppStorage(wrappedValue: Favourited(), UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: userDefaultSuite))
        } else {
            self._favourited = AppStorage(wrappedValue: Favourited(), UserDefaultKeys.favouritedChannel)
        }
    }
    
    var body: some View {
        let filteredVideoCount = upcoming.videoList.filter { video in
            favourited.contains(video.channel.id)
        }.count
        
        Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(filteredVideoCount) \(upcomingLookAhead)")
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
    }
}

struct UpcomingFavouriteCountView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingFavouriteCountView()
    }
}
