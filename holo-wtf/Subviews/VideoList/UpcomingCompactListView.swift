//
//  UpcomingCompactListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingCompactListView: View {
    @EnvironmentObject var upcoming: VideoViewModel
    
    var body: some View {
        CompactListView(cellView: { live in
            UpcomingCellView(upcoming: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                UpcomingCountView()
            }
        })
    }
}

//struct UpcomingCompactListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingCompactListView()
//    }
//}
