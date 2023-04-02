//
//  PastWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct PastWatchView: View {
    @StateObject var past: PastViewModel
    let agency: AgencyEnum
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _past = StateObject(wrappedValue: PastViewModel(for: agency))
    }
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchPastCellView(past: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: past.dataStatus) {
                VideoCountView(videoType: .past)
                    .environmentObject(past as VideoViewModel)
            }
        })
        .navigationTitle(agency.getAgency().localizedName)
        .environmentObject(past as VideoViewModel)
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
