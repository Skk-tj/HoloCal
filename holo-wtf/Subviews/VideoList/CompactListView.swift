//
//  CompactListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct CompactListView<CellContent: View, DataStatusContent: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    let viewModel: VideoViewModel
    
    @Binding var searchText: String
    @ViewBuilder let cellView: (_ live: LiveVideo) -> CellContent
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        VideoListView(viewModel: viewModel, searchText: $searchText, singleVideoView: { live in
            SwipableLinkedCellView(video: live) {
                cellView(live)
            }
            .contextMenu {
                VideoContextMenu(video: live, twitterLink: self.viewModel.twitterList[live.channel.id] ?? nil)
            }
        }, dataStatusView: {
            dataStatusView()
        })
    }
}

//struct CellListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CellListView()
//    }
//}
