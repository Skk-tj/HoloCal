//
//  LiveiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveiPadView: View {
    @StateObject var live: LiveViewModel
    
    @State var isShowingCollabSheet: Bool = false
    @State var collabChannels: [Channel] = [Channel.testChannel]
    
    @State var sortingStrategy: SortingStrategy = .notSorting
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel())
    }
    
    var body: some View {
        iPadLazyGirdView(singleVideoView: { live in
            LinkedVideoView(url: live.url) {
                LivePaneView(live: live, isShowingCollabSheet: $isShowingCollabSheet, collabChannels: $collabChannels)
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
            sortingStrategy = .notSorting
        }
        .navigationTitle("LIVE_VIEW_TITLE")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                LiveViewToolbar(sortingStrategy: $sortingStrategy)
                    .environmentObject(live as VideoViewModel)
                Button(action: {
                    Task {
                        await live.getLive()
                        sortingStrategy = .notSorting
                    }
                }, label: {
                    Label("Refresh", systemImage: "arrow.triangle.2.circlepath")
                })
            }
        }
        .sheet(isPresented: $isShowingCollabSheet) {
            LiveCollabListView(mentions: $collabChannels)
        }
    }
}

struct LiveiPadView_Previews: PreviewProvider {
    static var previews: some View {
        LiveiPadView()
    }
}
