//
//  CardListView.swift
//  holo-wtf
//
//
//

import SwiftUI

/// The view that represents a list of cards. 
struct CardListView<PaneContent: View, StatusContent: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    @EnvironmentObject var viewModel: VideoViewModel
    
    @Binding var isSorting: Bool
    
    /// The view of a single element in the list.
    @ViewBuilder let paneView: (_ live: LiveVideo) -> PaneContent
    
    /// The view of the counter at the bottom.
    @ViewBuilder let dataStatusView: () -> StatusContent
    
    var body: some View {
        VideoListView(isSorting: $isSorting, singleVideoView: { live in
            SwipableLinkedCellView(video: live) {
                paneView(live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
        }, dataStatusView: {
            dataStatusView()
        })
        .listStyle(.plain)
    }
}

//struct CardListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardListView()
//    }
//}
