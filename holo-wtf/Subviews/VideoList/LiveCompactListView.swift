//
//  LiveCompactListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveCompactListView: View {
    @Binding var isSorting: Bool
    @EnvironmentObject var live: VideoViewModel
    
    var body: some View {
        CompactListView(isSorting: $isSorting, cellView: { live in
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
