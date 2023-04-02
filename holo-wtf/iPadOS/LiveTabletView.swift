//
//  LiveTabletView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveTabletView: View {
    @StateObject var live: VideoViewModel
    let agency: AgencyEnum
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _live = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: .live))
    }
    
    var body: some View {
        LazyGridView(singleVideoView: { live in
            LinkedVideoView(url: live.url) {
                LivePaneView(live: live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                VideoCountView(videoType: .live)
            }
        }, isFavourite: false)
        .environmentObject(live)
        .task {
            live.sortingStrategy = .timeDesc
            await live.getVideoForUI()
            currentPresentationMode = .normal
        }
        .refreshable {
            live.sortingStrategy = .timeDesc
            await live.getVideoForUI()
            currentPresentationMode = .normal
        }
        .navigationTitle(agency.getAgency().localizedName)
        .toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(live)
            }
        }
        .animation(.easeInOut, value: live.dataStatus)
    }
}

struct LiveTabletView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTabletView(for: .hololive)
    }
}
