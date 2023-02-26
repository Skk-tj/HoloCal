//
//  PastWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct PastWatchView: View {
    @StateObject var past: PastViewModel
    
    init(for agency: AgencyEnum) {
        _past = StateObject(wrappedValue: PastViewModel(for: agency))
    }
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchPastCellView(past: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: past.dataStatus) {
                PastCountView()
                    .environmentObject(past as VideoViewModel)
            }
        })
        .navigationTitle("PAST_VIEW_TITLE")
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
