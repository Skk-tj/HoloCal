//
//  UpcomingFavouritesiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingFavouritesiPadView: View {
    @StateObject var upcoming: UpcomingFavoritesViewModel = UpcomingFavoritesViewModel()
    
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
            await upcoming.getVideoForUI()
        }
        .refreshable {
            await upcoming.getVideoForUI()
        }
        .toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                UpcomingFavouritesViewToolbar()
                    .environmentObject(upcoming as VideoViewModel)
            }
        }
        .navigationTitle("UPCOMING_VIEW_TITLE")
        .animation(.easeInOut, value: upcoming.dataStatus)
    }
}

struct UpcomingFavouritesiPadView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingFavouritesiPadView()
    }
}
