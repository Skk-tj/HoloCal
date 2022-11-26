//
//  UIFavouriteListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UIFavouriteListView<ElementContent: View, StatusContent: View>: View {
    @EnvironmentObject var viewModel: VideoViewModel
    
    /// The view of a single element in the list.
    @ViewBuilder let elementView: (_ live: LiveVideo) -> ElementContent
    
    /// The view of the counter at the bottom.
    @ViewBuilder let dataStatusView: () -> StatusContent
    
    let uiMode: UIMode
    
    var body: some View {
        switch uiMode {
        case .compact:
            FavouritesVideoListView(singleVideoView: { live in
                SwipableLinkedCellView(video: live) {
                    elementView(live)
                }
                .contextMenu {
                    VideoContextMenu(video: live)
                }
            }, dataStatusView: {
                dataStatusView()
            })
        case .card:
            FavouritesVideoListView(singleVideoView: { video in
                SwipableLinkedCellView(video: video) {
                    elementView(video)
                }
                .listSectionSeparator(.hidden)
                .listRowSeparator(.hidden)
                .contextMenu {
                    VideoContextMenu(video: video)
                }
            }, dataStatusView: {
                dataStatusView()
            })
            .listStyle(.plain)
        }
    }
}
