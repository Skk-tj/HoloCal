//
//  LiveCardListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveCardListView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    @State var searchText: String = ""
    
    let live: LiveViewModel
    
    var body: some View {
        CardListView(viewModel: live, searchText: $searchText, paneView: { live in
            LivePaneView(live: live)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count)")
                    .foregroundColor(.secondary)
            }
        })
    }
}

//struct LiveCardListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveCardListView()
//    }
//}
