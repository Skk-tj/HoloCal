//
//  LiveTabletView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveTabletView: View {
    @StateObject var live: LiveViewModel
    let agency: AgencyEnum
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _live = StateObject(wrappedValue: LiveViewModel(for: agency))
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
        .environmentObject(live as VideoViewModel)
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
                    .environmentObject(live as VideoViewModel)
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
