//
//  LiveCompactListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct LiveCompactListView: View {
    @Binding var sortingStrategy: SortingStrategy
    @EnvironmentObject var live: VideoViewModel
    
    var body: some View {
        CompactListView(sortingStrategy: $sortingStrategy, cellView: { live in
            LiveCellView(live: live)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                LiveCountView()
            }
        })
    }
}

//struct LiveCompactListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveCompactListView()
//    }
//}
