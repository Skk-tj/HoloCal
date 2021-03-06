//
//  UpcomingiPadView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-23.
//

import SwiftUI

struct UpcomingiPadView: View {
    @StateObject var upcoming: UpcomingViewModel
    
    @State var isShowingCollabSheet: Bool = false
    @State var collabChannels: [Channel] = [Channel.testChannel]
    
    @State var sortingStrategy: SortingStrategy = .notSorting
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        iPadLazyGirdView(singleVideoView: { live in
            LinkedVideoView(url: live.url) {
                UpcomingPaneView(upcoming: live, isShowingCollabSheet: $isShowingCollabSheet, collabChannels: $collabChannels)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
        }, countView: {
            UpcomingCountView()
        })
        .environmentObject(upcoming as VideoViewModel)
        .task {
            await upcoming.getUpcoming()
            
            // Reset sorting state, go back to section view
            sortingStrategy = .notSorting
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                UpcomingViewToolbar(sortingStrategy: $sortingStrategy)
                    .environmentObject(upcoming as VideoViewModel)
                Button(action: {
                    Task {
                        await upcoming.getUpcoming()
                        sortingStrategy = .notSorting
                    }
                }, label: {
                    Label("Refresh", systemImage: "arrow.triangle.2.circlepath")
                })
            }
        }
        .navigationTitle("UPCOMING_VIEW_TITLE")
        .sheet(isPresented: $isShowingCollabSheet) {
            LiveCollabListView(mentions: $collabChannels)
        }
    }
}

struct UpcomingiPadView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingiPadView()
    }
}
