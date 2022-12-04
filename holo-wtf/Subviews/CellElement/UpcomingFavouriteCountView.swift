//
//  UpcomingFavouriteCountView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingFavouriteCountView: View {
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var upcomingLookAhead = 48
    @AppStorage(UserDefaultKeys.favouritedChannel) var favourited = Favourited()
    
    @EnvironmentObject var upcoming: VideoViewModel
    
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
