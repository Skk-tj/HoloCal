//
//  UpcomingTabletView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingTabletView: View {
    @StateObject var upcoming: VideoViewModel
    let agency: AgencyEnum
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _upcoming = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: .upcoming))
    }
    
    var body: some View {
        LazyGridView(singleVideoView: { live in
            LinkedVideoView(url: live.url) {
                UpcomingPaneView(upcoming: live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                VideoCountView(videoType: .upcoming)
            }
        }, isFavourite: false)
        .environmentObject(upcoming)
        .task {
            upcoming.sortingStrategy = .timeAsc
            await upcoming.getVideoForUI()
            currentPresentationMode = .normal
        }
        .refreshable {
            upcoming.sortingStrategy = .timeAsc
            await upcoming.getVideoForUI()
            currentPresentationMode = .normal
        }
        .toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(upcoming)
            }
        }
        .navigationTitle(agency.getAgency().localizedName)
        .animation(.easeInOut, value: upcoming.dataStatus)
    }
}

struct UpcomingTabletView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingTabletView(for: .hololive)
    }
}
