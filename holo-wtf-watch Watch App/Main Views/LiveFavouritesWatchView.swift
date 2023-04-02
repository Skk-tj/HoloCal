//
//  LiveFavouritesWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct LiveFavouritesWatchView: View {
    @StateObject var live = LiveFavoritesViewModel()
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchLiveCellView(live: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                VideoFavouriteCountView(videoType: .live)
                    .environmentObject(live as VideoViewModel)
            }
        })
        .navigationTitle("LIVE_VIEW_TITLE")
        .environmentObject(live as VideoViewModel)
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

struct LiveFavouritesWatchView_Previews: PreviewProvider {
    static var previews: some View {
        LiveFavouritesWatchView()
    }
}
