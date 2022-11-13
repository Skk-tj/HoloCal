//
//  UpcomingiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingiPadView: View {
    @StateObject var upcoming: UpcomingViewModel
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel(for: .hololive))
    }
    
    var body: some View {
        iPadLazyGirdView(singleVideoView: { live in
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
        })
        .environmentObject(upcoming as VideoViewModel)
        .task {
            await upcoming.getUpcoming()
            
            // Reset sorting state, go back to section view
            currentPresentationMode = .normal
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(upcoming as VideoViewModel)
                Button(action: {
                    Task {
                        await upcoming.getUpcoming()
                        currentPresentationMode = .normal
                    }
                }, label: {
                    Label("Refresh", systemImage: "arrow.triangle.2.circlepath")
                })
            }
        }
        .navigationTitle("UPCOMING_VIEW_TITLE")
    }
}

struct UpcomingiPadView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingiPadView()
    }
}
