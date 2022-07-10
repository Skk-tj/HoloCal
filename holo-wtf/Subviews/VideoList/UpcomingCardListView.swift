//
//  UpcomnigCardListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct UpcomingCardListView: View {
    @Binding var sortingStrategy: SortingStrategy
    @Binding var isShowingCollabSheet: Bool
    @Binding var collabChannels: [Channel]
    
    @EnvironmentObject var upcoming: VideoViewModel
    
    var body: some View {
        CardListView(sortingStrategy: $sortingStrategy, paneView: { live in
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
