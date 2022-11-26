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
            await live.getLive()
            currentPresentationMode = .normal
        }
        .refreshable {
            await live.getLive()
            currentPresentationMode = .normal
        }
        .navigationTitle("LIVE_VIEW_TITLE")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(live as VideoViewModel)
            }
        }
    }
}

struct LiveiPadView_Previews: PreviewProvider {
    static var previews: some View {
        LiveiPadView(for: .hololive)
    }
}
