//
//  LiveCardListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveCardListView: View {
    @Binding var isSorting: Bool
    @EnvironmentObject var live: VideoViewModel
    
    var body: some View {
        CardListView(isSorting: $isSorting, paneView: { live in
            LivePaneView(live: live)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                LiveCountView()
            }
        })
    }
}

//struct LiveCardListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveCardListView()
//    }
//}
