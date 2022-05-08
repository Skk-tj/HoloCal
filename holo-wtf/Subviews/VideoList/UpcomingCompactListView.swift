//
//  UpcomingCompactListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct UpcomingCompactListView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var upcomingLookAhead = 48
    @AppStorage("generationListSelection") var generationListSelection = Set(GenerationEnum.allCases)
    @State var searchText: String = ""
    
    let upcoming: UpcomingViewModel
    
    var body: some View {
        CompactListView(viewModel: upcoming, searchText: $searchText, cellView: { live in
            UpcomingCellView(upcoming: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                let filteredVideoCount = upcoming.videoList.filter { video in
                    !generationListSelection.contains(video.channel.talent.inGeneration)
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
        })
    }
}

//struct UpcomingCompactListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingCompactListView()
//    }
//}
