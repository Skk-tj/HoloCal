//
//  LiveFavouritesiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveFavouritesiPadView: View {
    @StateObject var live: LiveFavoritesViewModel = LiveFavoritesViewModel(groupName: "group.io.skk-tj.holo-wtf.ios")
    
    var body: some View {
        iPadLazyGridView(singleVideoView: { live in
            LinkedVideoView(url: live.url) {
                LivePaneView(live: live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                LiveFavouriteCountView()
            }
        }, isFavourite: true)
        .environmentObject(live as VideoViewModel)
        .task {
            await live.getVideoForUI()
        }
        .refreshable {
            await live.getVideoForUI()
        }
        .navigationTitle("LIVE_VIEW_TITLE")
        .toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                LiveFavouritesViewToolbar()
                    .environmentObject(live as VideoViewModel)
            }
        }
        .animation(.easeInOut, value: live.dataStatus)
    }
}

struct LiveFavouritesiPadView_Previews: PreviewProvider {
    static var previews: some View {
        LiveFavouritesiPadView()
    }
}
