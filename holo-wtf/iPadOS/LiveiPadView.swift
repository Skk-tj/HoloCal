//
//  LiveiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveiPadView: View {
    @StateObject var live: LiveViewModel
    let agency: AgencyEnum
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _live = StateObject(wrappedValue: LiveViewModel(for: agency))
    }
    
    var body: some View {
        iPadLazyGridView(singleVideoView: { live in
            LinkedVideoView(url: live.url) {
                LivePaneView(live: live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: live.dataStatus) {
                LiveCountView()
            }
        }, isFavourite: false)
        .environmentObject(live as VideoViewModel)
        .task {
            live.sortingStrategy = .timeDesc
            await live.getVideoForUI()
            currentPresentationMode = .normal
        }
        .refreshable {
            await live.getVideoForUI()
            currentPresentationMode = .normal
        }
        .navigationTitle(agencyEnumToAgency[agency]!.localizedName)
        .toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(live as VideoViewModel)
            }
        }
        .animation(.easeInOut, value: live.dataStatus)
    }
}

struct LiveiPadView_Previews: PreviewProvider {
    static var previews: some View {
        LiveiPadView(for: .hololive)
    }
}
