//
//  CompactListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct CompactListView<CellContent: View, DataStatusContent: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    @EnvironmentObject var viewModel: VideoViewModel
    
    @Binding var isSorting: Bool
    @ViewBuilder let cellView: (_ live: LiveVideo) -> CellContent
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        VideoListView(isSorting: $isSorting, singleVideoView: { live in
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