//
//  UpcomingFavouritesWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct UpcomingFavouritesWatchView: View {
    @StateObject var upcoming = UpcomingFavoritesViewModel()
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchUpcomingCellView(upcoming: video)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                VideoFavouriteCountView(videoType: .upcoming)
                    .font(.footnote)
                    .environmentObject(upcoming as VideoViewModel)
            }
        })
        .navigationTitle("UPCOMING_VIEW_TITLE")
        .environmentObject(upcoming as VideoViewModel)
        .task {
            upcoming.sortingStrategy = .timeAsc
            await upcoming.getVideoForUI()
        }
        .refreshable {
            upcoming.sortingStrategy = .timeAsc
            await upcoming.getVideoForUI()
        }
    }
}

struct UpcomingFavouritesWatchView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingFavouritesWatchView()
    }
}
