//
//  UpcomingCompactListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct UpcomingCompactListView: View {
    @Binding var sortingStrategy: SortingStrategy
    @EnvironmentObject var upcoming: VideoViewModel
    
    var body: some View {
        CompactListView(sortingStrategy: $sortingStrategy, cellView: { live in
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
