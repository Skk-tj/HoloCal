//
//  CompactListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-26.
//

import SwiftUI

struct CompactListView<CellContent: View, DataStatusContent: View>: View {    
    @EnvironmentObject var viewModel: VideoViewModel
    
    @Binding var sortingStrategy: SortingStrategy
    @ViewBuilder let cellView: (_ live: LiveVideo) -> CellContent
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        VideoListView(sortingStrategy: $sortingStrategy, singleVideoView: { live in
            SwipableLinkedCellView(video: live) {
                cellView(live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
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
