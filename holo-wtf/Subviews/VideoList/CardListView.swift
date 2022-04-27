//
//  CardListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct CardListView<PaneContent: View, StatusContent: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    let viewModel: VideoViewModel
    
    @Binding var searchText: String
    @ViewBuilder let paneView: (_ live: LiveVideo) -> PaneContent
    @ViewBuilder let dataStatusView: () -> StatusContent
    
    var body: some View {
        VideoListView(viewModel: viewModel, searchText: $searchText, singleVideoView: { live in
            SwipableLinkedCellView(video: live) {
                paneView(live)
            }
            .contextMenu {
                VideoContextMenu(video: live, twitterLink: self.viewModel.twitterList[live.channel.id] ?? nil)
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
