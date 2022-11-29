//
//  UpcomingWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct UpcomingWatchView: View {
    @StateObject var upcoming: UpcomingViewModel
    
    init(for agency: AgencyEnum) {
        _upcoming = StateObject(wrappedValue: UpcomingViewModel(for: agency))
    }
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
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
            await upcoming.getVideoForUI()
        }
        .refreshable {
            await upcoming.getVideoForUI()
        }
    }
}

struct UpcomingWatchView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingWatchView(for: .hololive)
    }
}
