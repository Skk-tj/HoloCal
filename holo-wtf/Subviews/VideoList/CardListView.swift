//
//  CardListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-25.
//

import SwiftUI

/// The view that represents a list of cards. 
struct CardListView<PaneContent: View, StatusContent: View>: View {    
    @EnvironmentObject var viewModel: VideoViewModel
    
    @Binding var currentPresentationMode: PresentationMode
    
    /// The view of a single element in the list.
    @ViewBuilder let paneView: (_ live: LiveVideo) -> PaneContent
    
    /// The view of the counter at the bottom.
    @ViewBuilder let dataStatusView: () -> StatusContent
    
    var body: some View {
        VideoListView(currentPresentationMode: $currentPresentationMode, singleVideoView: { live in
            SwipableLinkedCellView(video: live) {
                paneView(live)
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

//struct CardListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardListView()
//    }
//}
