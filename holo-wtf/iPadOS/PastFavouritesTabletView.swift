//
//  PastFavouritesTabletView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastFavouritesTabletView: View {
    @StateObject var past = VideoFavoritesViewModel(videoType: .past)
    
    var body: some View {
        LazyGridView(singleVideoView: { live in
            LinkedVideoView(url: live.url) {
                PastPaneView(past: live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: past.dataStatus) {
                VideoFavouriteCountView(videoType: .past)
            }
        }, isFavourite: true)
        .environmentObject(past)
        .task {
            await past.getVideoForUI()
        }
        .refreshable {
            await past.getVideoForUI()
        }
        .toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                PastFavouritesViewToolbar()
                    .environmentObject(past)
            }
        }
        .navigationTitle("PAST_VIEW_TITLE")
        .animation(.easeInOut, value: past.dataStatus)
    }
}

struct PastFavouritesTabletView_Previews: PreviewProvider {
    static var previews: some View {
        PastFavouritesTabletView()
    }
}
