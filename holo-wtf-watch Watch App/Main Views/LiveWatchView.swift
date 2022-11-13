//
//  LiveWatchView.swift
//  holo-wtf-watch Watch App
//
//  Created by Haoyi An on 2022-09-18.
//

import SwiftUI

struct LiveWatchView: View {
    @StateObject var live: LiveViewModel
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel(for: .hololive))
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
            await live.getLive()
        }
        .refreshable {
            await live.getLive()
        }
    }
}

struct LiveWatchView_Previews: PreviewProvider {
    static var previews: some View {
        LiveWatchView()
    }
}
