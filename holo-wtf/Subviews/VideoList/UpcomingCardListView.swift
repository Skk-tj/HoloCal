//
//  UpcomnigCardListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingCardListView: View {
    @Binding var currentPresentationMode: PresentationMode
    
    @EnvironmentObject var upcoming: HololiveVideoViewModel
    
    var body: some View {
        CardListView(currentPresentationMode: $currentPresentationMode, paneView: { live in
            UpcomingPaneView(upcoming: live)
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
