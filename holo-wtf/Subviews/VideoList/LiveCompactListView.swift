//
//  LiveCompactListView.swift
//  holo-wtf
//
//
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
