//
//  LiveCountView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-08.
//

import SwiftUI

struct LiveCountView: View {
    @AppStorage("generationListSelection") var generationListSelection = Set(HololiveGeneration.allCases)
    
    @EnvironmentObject var live: HololiveVideoViewModel
    
    var body: some View {
        let filteredVideoCount = live.videoList.filter { video in
            !generationListSelection.contains(video.channel.talent?.inGeneration ?? .other)
        }
            .count
        
        if filteredVideoCount == 0 {
            Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count)")
                .foregroundColor(.secondary)
        } else {
            Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count) \(filteredVideoCount)")
                .foregroundColor(.secondary)
        }
    }
}

//struct LiveCountView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveCountView(live: LiveViewModel())
//    }
//}
