//
//  UpcomingCompactListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingCompactListView: View {
    @Binding var currentPresentationMode: PresentationMode
    @EnvironmentObject var upcoming: HololiveVideoViewModel
    
    var body: some View {
        CompactListView(currentPresentationMode: $currentPresentationMode, cellView: { live in
            UpcomingCellView(upcoming: live)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                UpcomingCountView()
            }
        })
    }
}

//struct UpcomingCompactListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingCompactListView()
//    }
//}
