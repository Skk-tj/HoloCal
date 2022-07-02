//
//  LiveiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveiPadView: View {
    @StateObject var live: LiveViewModel
    
    @State var isSorting: Bool = false
    @State var sortingSelection: SortingStrategy = .notSorting
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel())
    }
    
    var body: some View {
        iPadLazyGirdView(singleVideoView: { live in
            LivePaneView(live: live)
        }, countView: {
            LiveCountView()
        })
        .environmentObject(live as VideoViewModel)
        .task {
            await live.getLive()
            
            // Reset sorting state, go back to section view
            isSorting = false
            sortingSelection = .notSorting
        }
        .navigationTitle("LIVE_VIEW_TITLE")
        .toolbar {
            ToolbarItemGroup {
                LiveViewToolbar(sortingSelection: $sortingSelection, isSorting: $isSorting)
                    .environmentObject(live as VideoViewModel)
                Button(action: {
                    Task {
                        await live.getLive()
                        
                        // Reset sorting state, go back to section view
                        isSorting = false
                        sortingSelection = .notSorting
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
