//
//  CompactListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct CompactListView<CellContent: View, DataStatusContent: View>: View {    
    @EnvironmentObject var viewModel: VideoViewModel
    
    @Binding var currentPresentationMode: PresentationMode
    @ViewBuilder let cellView: (_ live: LiveVideo) -> CellContent
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        VideoListView(currentPresentationMode: $currentPresentationMode, singleVideoView: { live in
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
