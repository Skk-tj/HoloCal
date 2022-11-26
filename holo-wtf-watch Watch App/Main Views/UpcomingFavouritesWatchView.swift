//
//  UpcomingFavouritesWatchView.swift
//  holo-wtf-watch Watch App
//
//  Created by Haoyi An on 2022-11-26.
//

import SwiftUI

struct UpcomingFavouritesWatchView: View {
    @StateObject var upcoming: UpcomingFavoritesViewModel = UpcomingFavoritesViewModel(for: .hololive)
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchUpcomingCellView(upcoming: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                UpcomingFavouriteCountView()
                    .font(.footnote)
                    .environmentObject(upcoming as VideoViewModel)
            }
        })
        .navigationTitle("UPCOMING_VIEW_TITLE")
        .environmentObject(upcoming as VideoViewModel)
        .task {
            await upcoming.getVideoForUI()
        }
        .refreshable {
            await upcoming.getVideoForUI()
        }
    }
}

struct UpcomingFavouritesWatchView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingFavouritesWatchView()
    }
}
