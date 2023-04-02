//
//  UpcomingWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct UpcomingWatchView: View {
    @StateObject var upcoming: UpcomingViewModel
    let agency: AgencyEnum
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _upcoming = StateObject(wrappedValue: UpcomingViewModel(for: agency))
    }
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchUpcomingCellView(upcoming: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                VideoCountView(videoType: .upcoming)
                    .font(.footnote)
                    .environmentObject(upcoming as VideoViewModel)
            }
        })
        .navigationTitle(agency.getAgency().localizedName)
        .environmentObject(upcoming as VideoViewModel)
        .task {
            upcoming.sortingStrategy = .timeAsc
            await upcoming.getVideoForUI()
        }
        .refreshable {
            upcoming.sortingStrategy = .timeAsc
            await upcoming.getVideoForUI()
        }
    }
}

struct UpcomingWatchView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingWatchView(for: .hololive)
    }
}
