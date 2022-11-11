//
//  LiveiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveiPadView: View {
    @StateObject var live: HololiveLiveViewModel
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init() {
        self._live = StateObject(wrappedValue: HololiveLiveViewModel())
    }
    
    var body: some View {
        iPadLazyGirdView(singleVideoView: { live in
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
        })
        .environmentObject(live as VideoViewModel)
        .task {
            await live.getLive()
            
            // Reset sorting state, go back to section view
            currentPresentationMode = .normal
        }
        .navigationTitle("LIVE_VIEW_TITLE")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(live as VideoViewModel)
                Button(action: {
                    Task {
                        await live.getLive()
                        currentPresentationMode = .normal
                    }
                }, label: {
                    Label("Refresh", systemImage: "arrow.triangle.2.circlepath")
                })
            }
        }
    }
}

struct LiveiPadView_Previews: PreviewProvider {
    static var previews: some View {
        LiveiPadView()
    }
}
