//
//  UpcomnigCardListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct UpcomingCardListView: View {
    @Binding var currentPresentationMode: PresentationMode
    
    @EnvironmentObject var upcoming: VideoViewModel
    
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
