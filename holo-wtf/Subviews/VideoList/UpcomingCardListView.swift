//
//  UpcomnigCardListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingCardListView: View {
    @Binding var isSorting: Bool
    @EnvironmentObject var upcoming: VideoViewModel
    
    var body: some View {
        CardListView(isSorting: $isSorting, paneView: { live in
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