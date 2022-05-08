//
//  LiveCardListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveCardListView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage("generationListSelection") var generationListSelection = Set(GenerationEnum.allCases)
    @State var searchText: String = ""
    
    let live: LiveViewModel
    
    var body: some View {
        CardListView(viewModel: live, searchText: $searchText, paneView: { live in
            LivePaneView(live: live)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                let filteredVideoCount = live.videoList.filter { video in
                    !generationListSelection.contains(video.channel.talent.inGeneration)
                }
                    .count
                
                if filteredVideoCount == 0 {
                    Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count)")
                        .foregroundColor(.secondary)
                } else {
                    Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count) \(filteredVideoCount)")
                        .foregroundColor(.secondary)
                }
            }
        })
    }
}

//struct LiveCardListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveCardListView()
//    }
//}
