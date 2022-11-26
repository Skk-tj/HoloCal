//
//  LiveFavouritesWatchView.swift
//  holo-wtf-watch Watch App
//
//
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
            await live.getLive()
        }
        .refreshable {
            await live.getLive()
        }
    }
}

struct LiveFavouritesWatchView_Previews: PreviewProvider {
    static var previews: some View {
        LiveFavouritesWatchView()
    }
}
