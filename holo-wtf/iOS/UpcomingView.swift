//
//  UpcomingView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: UpcomingViewModel
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = false
    
    @State var isSorting: Bool = false
    @State var sortingSelection: SortingStrategy? = nil
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        NavigationView {
            if isShowingCompactInUpcomingView {
                UpcomingCompactListView(isSorting: $isSorting)
                    .environmentObject(upcoming as VideoViewModel)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        ToolbarItemGroup {
                            UpcomingViewToolbar(sortingSelection: $sortingSelection, isSorting: $isSorting)
                                .environmentObject(upcoming as VideoViewModel)
                        }
                    }
            } else {
                UpcomingCardListView(isSorting: $isSorting)
                    .environmentObject(upcoming as VideoViewModel)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        ToolbarItemGroup {
                            UpcomingViewToolbar(sortingSelection: $sortingSelection, isSorting: $isSorting)
                                .environmentObject(upcoming as VideoViewModel)
                        }
                    }
            }
        }
        .task {
            await upcoming.getUpcoming()
            
            // Reset sorting state, go back to section view
            isSorting = false
            sortingSelection = nil
        }
        .refreshable {
            await upcoming.getUpcoming()
            
            // Reset sorting state, go back to section view
            isSorting = false
            sortingSelection = nil
        }
        .navigationViewStyle(.stack)
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
