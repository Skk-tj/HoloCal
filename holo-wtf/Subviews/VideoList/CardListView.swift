//
//  CardListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct CardListView<PaneContent: View, StatusContent: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    @EnvironmentObject var viewModel: VideoViewModel
    
    @Binding var isSorting: Bool
    @ViewBuilder let paneView: (_ live: LiveVideo) -> PaneContent
    @ViewBuilder let dataStatusView: () -> StatusContent
    
    var body: some View {
        VideoListView(isSorting: $isSorting, singleVideoView: { live in
            SwipableLinkedCellView(video: live) {
                paneView(live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
            .listRowSeparator(.hidden)
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
