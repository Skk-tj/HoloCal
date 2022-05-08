//
//  LiveCardListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct LiveCardListView: View {
    @EnvironmentObject var live: VideoViewModel
    
    var body: some View {
        CardListView(paneView: { live in
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
