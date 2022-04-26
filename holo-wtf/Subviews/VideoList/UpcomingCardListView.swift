//
//  UpcomnigCardListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingCardListView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    @State var searchText: String = ""
    
    let upcoming: UpcomingViewModel
    
    var body: some View {
        CardListView(viewModel: upcoming, searchText: $searchText, paneView: { live in
            UpcomingPaneView(upcoming: live)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(upcoming.videoList.count) \(getUpcomingStreamLookAheadHoursFromUserDefaults())")
                    .foregroundColor(.secondary)
            }
        })
    }
}

//struct UpcomnigCardListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomnigCardListView()
//    }
//}
