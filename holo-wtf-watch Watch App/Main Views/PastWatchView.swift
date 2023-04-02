//
//  PastWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct PastWatchView: View {
    @StateObject var past: VideoViewModel
    let agency: AgencyEnum
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _past = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: .past))
    }
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchPastCellView(past: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: past.dataStatus) {
                VideoCountView(videoType: .past)
                    .environmentObject(past)
            }
        })
        .navigationTitle(agency.getAgency().localizedName)
        .environmentObject(past)
        .task {
            past.sortingStrategy = .endedFirst
            await past.getVideoForUI()
        }
        .refreshable {
            past.sortingStrategy = .endedFirst
            await past.getVideoForUI()
        }
    }
}

struct PastWatchView_Previews: PreviewProvider {
    static var previews: some View {
        PastWatchView(for: .hololive)
    }
}
