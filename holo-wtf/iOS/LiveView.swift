//
//  ContentView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
//

import SwiftUI

struct LiveView: View {
    @StateObject var live: LiveViewModel
    
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompactInLiveView: Bool = false
    
    @State var isShowingCollabSheet: Bool = false
    @State var collabChannels: [Channel] = [Channel.testChannel]
    
    @State var sortingStrategy: SortingStrategy = .notSorting
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel())
    }
    
    var body: some View {
        NavigationView {
            if isShowingCompactInLiveView {
                LiveCompactListView(sortingStrategy: $sortingStrategy)
                    .environmentObject(live as VideoViewModel)
                    .navigationTitle("LIVE_VIEW_TITLE")
                    .toolbar {
                        ToolbarItemGroup {
                            LiveViewToolbar(sortingStrategy: $sortingStrategy)
                                .environmentObject(live as VideoViewModel)
                        }
                    }
            } else {
                LiveCardListView(sortingStrategy: $sortingStrategy, isShowingCollabSheet: $isShowingCollabSheet, collabChannels: $collabChannels)
                    .environmentObject(live as VideoViewModel)
                    .navigationTitle("LIVE_VIEW_TITLE")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            LiveViewToolbar(sortingStrategy: $sortingStrategy)
                                .environmentObject(live as VideoViewModel)
                        }
                    }
            }
        }
        .task {
            await live.getLive()
            sortingStrategy = .notSorting
        }
        .refreshable {
            await live.getLive()
            sortingStrategy = .notSorting
        }
        .sheet(isPresented: $isShowingCollabSheet) {
            LiveCollabListView(mentions: $collabChannels)
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LiveView()
            LiveView().preferredColorScheme(.dark)
        }
    }
}
