//
//  PastFavouritesWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct PastFavouritesWatchView: View {
    @StateObject var past: PastFavoritesViewModel = PastFavoritesViewModel()
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchPastCellView(past: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: past.dataStatus) {
                PastFavouriteCountView(userDefaultSuite: nil)
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

struct PastFavouritesWatchView_Previews: PreviewProvider {
    static var previews: some View {
        PastFavouritesWatchView()
    }
}
