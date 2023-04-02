//
//  UpcomingiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingiPadView: View {
    @StateObject var upcoming: UpcomingViewModel
    let agency: AgencyEnum
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _upcoming = StateObject(wrappedValue: UpcomingViewModel(for: agency))
    }
    
    var body: some View {
        iPadLazyGridView(singleVideoView: { live in
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
        .environmentObject(upcoming as VideoViewModel)
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
                    .environmentObject(upcoming as VideoViewModel)
            }
        }
        .navigationTitle(agency.getAgency().localizedName)
        .animation(.easeInOut, value: upcoming.dataStatus)
    }
}

struct UpcomingiPadView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingiPadView(for: .hololive)
    }
}
