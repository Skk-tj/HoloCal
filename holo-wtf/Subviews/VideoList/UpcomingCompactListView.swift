//
//  UpcomingCompactListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingCompactListView: View {
    @Binding var isSorting: Bool
    @EnvironmentObject var upcoming: VideoViewModel
    
    var body: some View {
        CompactListView(isSorting: $isSorting, cellView: { live in
            UpcomingCellView(upcoming: live)
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
