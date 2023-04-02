//
//  UIListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UIListView<ElementContent: View, StatusContent: View>: View {
    @EnvironmentObject var viewModel: VideoViewModel
    
    @Binding var currentPresentationMode: PresentationMode
    let isFavourite: Bool
    
    /// The view of a single element in the list.
    @ViewBuilder let elementView: (_ live: LiveVideo) -> ElementContent
    
    /// The view of the counter at the bottom.
    @ViewBuilder let dataStatusView: () -> StatusContent
    
    let uiMode: UIMode
    
    var body: some View {
        switch uiMode {
        case .compact:
            VideoListView(currentPresentationMode: $currentPresentationMode, isFavourite: isFavourite, singleVideoView: { live in
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
            VideoListView(currentPresentationMode: $currentPresentationMode, isFavourite: isFavourite, singleVideoView: { live in
                SwipableLinkedCellView(video: live) {
                    elementView(live)
                }
                .listSectionSeparator(.hidden)
                .listRowSeparator(.hidden)
                .contextMenu {
                    VideoContextMenu(video: live)
                }
            }, dataStatusView: {
                dataStatusView()
            })
            .listStyle(.plain)
        }
    }
}
