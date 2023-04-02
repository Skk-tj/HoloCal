//
//  VideoFavouriteCountView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoFavouriteCountView: View {
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var upcomingLookAhead = 48
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    @EnvironmentObject var video: VideoViewModel
    
    let videoType: VideoType
    
    var body: some View {
        let filteredVideoCount = video.videoList.filter { video in
            favourited.contains(video.channel.id)
        }.count
        
        switch videoType {
        case .live:
            Text("LIVE_VIEW_CURRENT_COUNT \(filteredVideoCount)")
                .foregroundColor(.secondary)
        case .upcoming:
            Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(filteredVideoCount) \(upcomingLookAhead)")
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        case .past:
            Text("PAST_VIEW_CURRENT_COUNT \(filteredVideoCount)")
                .foregroundColor(.secondary)
        }
    }
}

struct VideoFavouriteCountView_Previews: PreviewProvider {
    static var previews: some View {
        VideoFavouriteCountView(videoType: .live)
        VideoFavouriteCountView(videoType: .upcoming)
        VideoFavouriteCountView(videoType: .past)
    }
}
