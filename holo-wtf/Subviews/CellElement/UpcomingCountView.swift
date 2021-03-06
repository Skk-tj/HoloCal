//
//  UpcomingCountView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-08.
//

import SwiftUI

struct UpcomingCountView: View {
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var upcomingLookAhead = 48
    @AppStorage("generationListSelection") var generationListSelection = Set(GenerationEnum.allCases)
    
    @EnvironmentObject var upcoming: VideoViewModel
    
    var body: some View {
        let filteredVideoCount = upcoming.videoList.filter { video in
            !generationListSelection.contains(video.channel.talent?.inGeneration ?? .other)
        }
            .count
        
        if filteredVideoCount == 0 {
            Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(upcoming.videoList.count) \(upcomingLookAhead)")
                .foregroundColor(.secondary)
        } else {
            Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(upcoming.videoList.count) \(upcomingLookAhead) \(filteredVideoCount)")
                .foregroundColor(.secondary)
        }
    }
}

//struct UpcomingCountView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingCountView(upcoming: UpcomingViewModel())
//    }
//}
