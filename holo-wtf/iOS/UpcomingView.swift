//
//  UpcomingView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-22.
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: UpcomingViewModel
    
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = false
    
    @State var isShowingCollabSheet: Bool = false
    @State var collabChannels: [Channel] = [Channel.testChannel]
    
    @State var sortingStrategy: SortingStrategy = .notSorting
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        NavigationView {
            if isShowingCompactInUpcomingView {
                UpcomingCompactListView(sortingStrategy: $sortingStrategy)
                    .environmentObject(upcoming as VideoViewModel)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        ToolbarItemGroup {
                            UpcomingViewToolbar(sortingStrategy: $sortingStrategy)
                                .environmentObject(upcoming as VideoViewModel)
                        }
                    }
            } else {
                UpcomingCardListView(sortingStrategy: $sortingStrategy, isShowingCollabSheet: $isShowingCollabSheet, collabChannels: $collabChannels)
                    .environmentObject(upcoming as VideoViewModel)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            UpcomingViewToolbar(sortingStrategy: $sortingStrategy)
                                .environmentObject(upcoming as VideoViewModel)
                        }
                    }
            }
        }
        .task {
            await upcoming.getUpcoming()
            sortingStrategy = .notSorting
        }
        .refreshable {
            await upcoming.getUpcoming()
            sortingStrategy = .notSorting
        }
        .sheet(isPresented: $isShowingCollabSheet) {
            LiveCollabListView(mentions: $collabChannels)
        }
        .navigationViewStyle(.stack)
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
