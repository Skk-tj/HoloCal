//
//  LiveCountView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveCountView: View {
    @AppStorage("generationListSelection") var generationListSelection = Set(GenerationEnum.allCases)
    
    @EnvironmentObject var live: VideoViewModel
    
    var body: some View {
        let filteredVideoCount = live.videoList.filter { video in
            !generationListSelection.contains(video.channel.talent.inGeneration)
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
