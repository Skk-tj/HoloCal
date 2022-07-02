//
//  ContentView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveView: View {
    @StateObject var live: LiveViewModel
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompactInLiveView: Bool = false
    
    @State var isSorting: Bool = false
    @State var sortingSelection: SortingStrategy = .notSorting
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel())
    }
    
    var body: some View {
        NavigationView {
            if isShowingCompactInLiveView {
                LiveCompactListView(isSorting: $isSorting)
                    .environmentObject(live as VideoViewModel)
                    .navigationTitle("LIVE_VIEW_TITLE")
                    .toolbar {
                        ToolbarItemGroup {
                            LiveViewToolbar(sortingSelection: $sortingSelection, isSorting: $isSorting)
                                .environmentObject(live as VideoViewModel)
                        }
                    }
            } else {
                LiveCardListView(isSorting: $isSorting)
                    .environmentObject(live as VideoViewModel)
                    .navigationTitle("LIVE_VIEW_TITLE")
                    .toolbar {
                        ToolbarItemGroup {
                            LiveViewToolbar(sortingSelection: $sortingSelection, isSorting: $isSorting)
                                .environmentObject(live as VideoViewModel)
                        }
                    }
            }
        }
        .task {
            await live.getLive()
            
            // Reset sorting state, go back to section view
            isSorting = false
            sortingSelection = .notSorting
        }
        .refreshable {
            await live.getLive()
            
            // Reset sorting state, go back to section view
            isSorting = false
            sortingSelection = .notSorting
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
