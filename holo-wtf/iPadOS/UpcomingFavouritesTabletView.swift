//
//  UpcomingFavouritesTabletView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingFavouritesTabletView: View {
    @StateObject var upcoming = VideoFavoritesViewModel(videoType: .upcoming)
    
    var body: some View {
        LazyGridView(singleVideoView: { live in
            LinkedVideoView(url: live.url) {
                UpcomingPaneView(upcoming: live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                VideoFavouriteCountView(videoType: .upcoming)
            }
        }, isFavourite: true)
        .environmentObject(upcoming)
        .task {
            await upcoming.getVideoForUI()
        }
        .refreshable {
            await upcoming.getVideoForUI()
        }
        .toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                UpcomingFavouritesViewToolbar()
                    .environmentObject(upcoming)
            }
        }
        .navigationTitle("UPCOMING_VIEW_TITLE")
        .animation(.easeInOut, value: upcoming.dataStatus)
    }
}

struct UpcomingFavouritesTabletView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingFavouritesTabletView()
    }
}
