//
//  LiveViewToolbar.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-25.
//

import SwiftUI

struct LiveViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInLiveView) var isShowingAbsoluteTime: Bool = false
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompact: Bool = false
    
    @Binding var currentPresentationMode: PresentationMode
    
    /// Defines the current sorting strategy
    @State var sortingStrategy: SortingStrategy = .notSorting
    
    @EnvironmentObject var liveViewModel: HololiveVideoViewModel
    
    var body: some View {
        Menu {
            Section {
                Toggle(isOn: $isShowingAbsoluteTime, label: {
                    Label("LIVE_VIEW_TOOLBAR_SHOW_ABSOLUTE", systemImage: "clock")
                })
                
                if UIDevice.current.userInterfaceIdiom == .phone {
                    Button {
                        isShowingCompact.toggle()
                        UserDefaults.standard.set(isShowingCompact, forKey: UserDefaultKeys.isShowingCompactInLiveView)
                    } label: {
                        Label(isShowingCompact ? "LIVE_VIEW_TOOLBAR_SHOW_CARD" : "LIVE_VIEW_TOOLBAR_SHOW_COMPACT", systemImage: isShowingCompact ? "rectangle.grid.1x2" : "list.bullet")
                    }
                }
            }
            
            Menu {
                Picker("Order", selection: $sortingStrategy) {
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_GENERATION", systemImage: "person.fill").tag(SortingStrategy.notSorting)
                }
                
                Menu {
                    Picker("Order", selection: $sortingStrategy) {
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_NEAREST_TO_FURTHEST", systemImage: "arrow.down").tag(SortingStrategy.timeDesc)
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_FURTHEST_TO_NEAREST", systemImage: "arrow.up").tag(SortingStrategy.timeAsc)
                    }
                } label: {
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME", systemImage: "clock")
                }
                
                Menu {
                    Picker("Order", selection: $sortingStrategy) {
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_VIEWERS_ASCENDING", systemImage: "arrow.up").tag(SortingStrategy.viewersAsc)
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_VIEWERS_DESCENDING", systemImage: "arrow.down").tag(SortingStrategy.viewersDesc)
                    }
                } label: {
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_VIEWERS", systemImage: "person.3.sequence.fill")
                }
            } label: {
                Label("LIVE_VIEW_TOOLBAR_SORT", systemImage: "arrow.up.arrow.down")
            }
        } label: {
            Label("Display Settings", systemImage: "ellipsis")
        }
        .onChange(of: self.sortingStrategy, perform: { sortingSelection in
            if sortingSelection == .notSorting {
                currentPresentationMode = .normal
            } else {
                currentPresentationMode = .sorting
            }
            
            self.liveViewModel.sortVideos(by: sortingSelection)
        })
    }
}

//struct LiveViewToolbar_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveViewToolbar()
//    }
//}
