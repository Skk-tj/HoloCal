//
//  UpcomnigCardListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingCardListView: View {
    @Binding var currentPresentationMode: PresentationMode
    @Binding var isShowingCollabSheet: Bool
    @Binding var collabChannels: [Channel]
    
    @EnvironmentObject var upcoming: VideoViewModel
    
    var body: some View {
        CardListView(currentPresentationMode: $currentPresentationMode, paneView: { live in
            UpcomingPaneView(upcoming: live, isShowingCollabSheet: $isShowingCollabSheet, collabChannels: $collabChannels)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                UpcomingCountView()
            }
        })
    }
}

//struct UpcomnigCardListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomnigCardListView()
//    }
//}
