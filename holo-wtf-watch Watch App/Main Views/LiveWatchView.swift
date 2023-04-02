//
//  LiveWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct LiveWatchView: View {
    @StateObject var live: VideoViewModel
    let agency: AgencyEnum
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _live = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: .live))
    }
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchLiveCellView(live: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                VideoCountView(videoType: .live)
                    .environmentObject(live)
            }
        })
        .navigationTitle(agency.getAgency().localizedName)
        .environmentObject(live)
        .task {
            live.sortingStrategy = .timeDesc
            await live.getVideoForUI()
        }
        .refreshable {
            live.sortingStrategy = .timeDesc
            await live.getVideoForUI()
        }
    }
}

struct LiveWatchView_Previews: PreviewProvider {
    static var previews: some View {
        LiveWatchView(for: .hololive)
    }
}
