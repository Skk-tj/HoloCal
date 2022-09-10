//
//  LiveCardListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveCardListView: View {
    @Binding var currentPresentationMode: PresentationMode
    @Binding var isShowingCollabSheet: Bool
    @Binding var collabChannels: [Channel]
    
    @EnvironmentObject var live: VideoViewModel
    
    var body: some View {
        CardListView(currentPresentationMode: $currentPresentationMode, paneView: { live in
            LivePaneView(live: live, isShowingCollabSheet: $isShowingCollabSheet, collabChannels: $collabChannels)
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
