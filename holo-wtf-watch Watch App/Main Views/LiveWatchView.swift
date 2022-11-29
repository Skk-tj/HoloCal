//
//  LiveWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct LiveWatchView: View {
    @StateObject var live: LiveViewModel
    
    init(for agency: AgencyEnum) {
        _live = StateObject(wrappedValue: LiveViewModel(for: agency))
    }
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchLiveCellView(live: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                LiveCountView()
                    .environmentObject(live as VideoViewModel)
            }
        })
        .navigationTitle("LIVE_VIEW_TITLE")
        .environmentObject(live as VideoViewModel)
        .task {
            await live.getVideoForUI()
        }
        .refreshable {
            await live.getVideoForUI()
        }
    }
}

struct LiveWatchView_Previews: PreviewProvider {
    static var previews: some View {
        LiveWatchView(for: .hololive)
    }
}
