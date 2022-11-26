//
//  UpcomingiPadView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-23.
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
                UpcomingCountView()
            }
        }, isFavourite: false)
        .environmentObject(upcoming as VideoViewModel)
        .task {
            await upcoming.getVideoForUI()
            currentPresentationMode = .normal
        }
        .refreshable {
            await upcoming.getVideoForUI()
            currentPresentationMode = .normal
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(upcoming as VideoViewModel)
            }
        }
        .navigationTitle("UPCOMING_VIEW_TITLE")
    }
}

struct UpcomingiPadView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingiPadView(for: .hololive)
    }
}
