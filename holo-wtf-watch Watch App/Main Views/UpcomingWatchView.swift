//
//  UpcomingWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct UpcomingWatchView: View {
    @StateObject var upcoming: VideoViewModel
    let agency: AgencyEnum
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _upcoming = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: .upcoming))
    }
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchUpcomingCellView(upcoming: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                VideoCountView(videoType: .upcoming)
                    .font(.footnote)
                    .environmentObject(upcoming)
            }
        })
        .navigationTitle(agency.getAgency().localizedName)
        .environmentObject(upcoming)
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
