//
//  PastFavouritesiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastFavouritesiPadView: View {
    @StateObject var past: PastFavoritesViewModel = PastFavoritesViewModel(groupName: "group.io.skk-tj.holo-wtf.ios")
    
    var body: some View {
        iPadLazyGridView(singleVideoView: { live in
            LinkedVideoView(url: live.url) {
                PastPaneView(past: live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: past.dataStatus) {
                PastFavouriteCountView()
            }
        }, isFavourite: true)
        .environmentObject(past as VideoViewModel)
        .task {
            await past.getVideoForUI()
        }
        .refreshable {
            await past.getVideoForUI()
        }
        .toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                PastFavouritesViewToolbar()
                    .environmentObject(past as VideoViewModel)
            }
        }
        .navigationTitle("PAST_VIEW_TITLE")
        .animation(.easeInOut, value: past.dataStatus)
    }
}

struct PastFavouritesiPadView_Previews: PreviewProvider {
    static var previews: some View {
        PastFavouritesiPadView()
    }
}
