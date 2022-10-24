//
//  LiveCompactListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveCompactListView: View {
    @Binding var currentPresentationMode: PresentationMode
    @EnvironmentObject var live: HololiveVideoViewModel
    
    var body: some View {
        CompactListView(currentPresentationMode: $currentPresentationMode, cellView: { live in
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
