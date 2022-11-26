//
//  LiveFavouritesiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveFavouritesiPadView: View {
    @StateObject var live: LiveFavoritesViewModel
    
    init() {
        _live = StateObject(wrappedValue: LiveFavoritesViewModel(for: .hololive))
    }
    
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
            await live.getLive()
        }
        .refreshable {
            await live.getLive()
        }
        .navigationTitle("LIVE_VIEW_TITLE")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                LiveFavouritesViewToolbar()
                    .environmentObject(live as VideoViewModel)
            }
        }
    }
}

struct LiveFavouritesiPadView_Previews: PreviewProvider {
    static var previews: some View {
        LiveFavouritesiPadView()
    }
}
