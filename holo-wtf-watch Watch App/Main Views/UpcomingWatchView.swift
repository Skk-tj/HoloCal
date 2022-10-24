//
//  UpcomingWatchView.swift
//  holo-wtf-watch Watch App
//
//  Created by Haoyi An on 2022-09-18.
//

import SwiftUI

struct UpcomingWatchView: View {
    @StateObject var upcoming: UpcomingViewModel
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        WatchVideoListView<WatchUpcomingCellView, DataStatusIndicatorView, HololiveLiveVideo, HololiveChannel, HololiveVideoViewModel>(singleVideoView: { video in
            WatchUpcomingCellView(upcoming: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                UpcomingCountView()
                    .font(.footnote)
                    .environmentObject(upcoming as VideoViewModel)
            }
        })
        .navigationTitle("UPCOMING_VIEW_TITLE")
        .environmentObject(upcoming as VideoViewModel)
        .task {
            await upcoming.getUpcoming()
        }
        .refreshable {
            await upcoming.getUpcoming()
        }
    }
}

struct UpcomingWatchView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingWatchView()
    }
}
