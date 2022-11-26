//
//  LiveFavouritesWatchView.swift
//  holo-wtf-watch Watch App
//
//  Created by Haoyi An on 2022-11-26.
//

import SwiftUI

struct LiveFavouritesWatchView: View {
    @StateObject var live: LiveFavoritesViewModel = LiveFavoritesViewModel(for: .hololive)
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchLiveCellView(live: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                LiveFavouriteCountView()
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

struct LiveFavouritesWatchView_Previews: PreviewProvider {
    static var previews: some View {
        LiveFavouritesWatchView()
    }
}
