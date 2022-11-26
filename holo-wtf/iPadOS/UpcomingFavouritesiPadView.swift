//
//  UpcomingFavouritesiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingFavouritesiPadView: View {
    @StateObject var upcoming: UpcomingFavoritesViewModel
    
    init() {
        _upcoming = StateObject(wrappedValue: UpcomingFavoritesViewModel(for: .hololive))
    }
    
    var body: some View {
        iPadLazyGridView(singleVideoView: { live in
            LinkedVideoView(url: live.url) {
                UpcomingPaneView(upcoming: live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                UpcomingFavouriteCountView()
            }
        }, isFavourite: true)
        .environmentObject(upcoming as VideoViewModel)
        .task {
            await upcoming.getUpcoming()
        }
        .refreshable {
            await upcoming.getUpcoming()
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                UpcomingFavouritesViewToolbar()
                    .environmentObject(upcoming as VideoViewModel)
            }
        }
        .navigationTitle("UPCOMING_VIEW_TITLE")
    }
}

struct UpcomingFavouritesiPadView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingFavouritesiPadView()
    }
}
