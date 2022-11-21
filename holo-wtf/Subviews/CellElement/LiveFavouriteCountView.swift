//
//  LiveFavouriteCountView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-20.
//

import SwiftUI

struct LiveFavouriteCountView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    @EnvironmentObject var live: VideoViewModel
    
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
