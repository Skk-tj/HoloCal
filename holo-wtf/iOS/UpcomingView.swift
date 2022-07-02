//
//  UpcomingView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-22.
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: UpcomingViewModel
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = false
    
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
                UpcomingCardListView(sortingStrategy: $sortingStrategy)
                    .environmentObject(upcoming as VideoViewModel)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        ToolbarItemGroup {
                            UpcomingViewToolbar(sortingStrategy: $sortingStrategy)
                                .environmentObject(upcoming as VideoViewModel)
                        }
                    }
            }
        }
        .task {
            await upcoming.getUpcoming()
            
            // Reset sorting state, go back to section view
            sortingStrategy = .notSorting
        }
        .refreshable {
            await upcoming.getUpcoming()
            
            // Reset sorting state, go back to section view
            sortingStrategy = .notSorting
        }
        .navigationViewStyle(.stack)
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
