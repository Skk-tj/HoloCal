//
//  LiveCompactListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct LiveCompactListView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @State var searchText: String = ""
    
    let live: LiveViewModel
    
    var body: some View {
        CompactListView(viewModel: live, searchText: $searchText, cellView: { live in
            LiveCellView(live: live, twitterLink: self.live.twitterList[live.channel.id] ?? nil)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count)")
                    .foregroundColor(.secondary)
            }
        })
    }
}

//struct LiveCompactListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveCompactListView()
//    }
//}
