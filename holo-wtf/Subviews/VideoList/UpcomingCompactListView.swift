//
//  UpcomingCompactListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct UpcomingCompactListView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @State var searchText: String = ""
    
    let upcoming: UpcomingViewModel
    
    var body: some View {
        CompactListView(viewModel: upcoming, searchText: $searchText, cellView: { live in
            UpcomingCellView(upcoming: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(upcoming.videoList.count) \(getUpcomingStreamLookAheadHoursFromUserDefaults())")
                    .foregroundColor(.secondary)
            }
        })
    }
}

//struct UpcomingCompactListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingCompactListView()
//    }
//}
