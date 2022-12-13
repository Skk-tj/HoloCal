//
//  LiveFavouritesViewToolbar.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveFavouritesViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInLiveFavouritesView) var isShowingAbsoluteTime: Bool = false
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveFavouritesView) var isShowingCompact: Bool = false
    
    /// Defines the current sorting strategy
    @State var sortingStrategy: SortingStrategy = .timeDesc
    
    @EnvironmentObject var liveViewModel: VideoViewModel
    
    var body: some View {
        Section {
            Toggle(isOn: $isShowingAbsoluteTime, label: {
                Label("LIVE_VIEW_TOOLBAR_SHOW_ABSOLUTE", systemImage: "clock")
            })
            
            if UIDevice.current.userInterfaceIdiom == .phone {
                Button {
                    isShowingCompact.toggle()
                } label: {
                    Label(isShowingCompact ? "LIVE_VIEW_TOOLBAR_SHOW_CARD" : "LIVE_VIEW_TOOLBAR_SHOW_COMPACT", systemImage: isShowingCompact ? "rectangle.grid.1x2" : "list.bullet")
                }
            }
        }
        
        Menu {
            Menu {
                Picker("Order", selection: $sortingStrategy) {
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_NEAREST_TO_FURTHEST", systemImage: "hourglass.tophalf.filled").tag(SortingStrategy.timeDesc)
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_FURTHEST_TO_NEAREST", systemImage: "hourglass.bottomhalf.filled").tag(SortingStrategy.timeAsc)
                }
            } label: {
                Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME", systemImage: "clock")
            }
            
            Menu {
                Picker("Order", selection: $sortingStrategy) {
                    Label(title: {
                        Text("LIVE_VIEW_TOOLBAR_SORT_BY_VIEWERS_DESCENDING")
                    }, icon: {
                        Image(systemName: "person.3.sequence.fill", variableValue: 1.0)
                    }).tag(SortingStrategy.viewersDesc)
                    
                    Label(title: {
                        Text("LIVE_VIEW_TOOLBAR_SORT_BY_VIEWERS_ASCENDING")
                    }, icon: {
                        Image(systemName: "person.3.sequence.fill", variableValue: 0.1)
                    }).tag(SortingStrategy.viewersAsc)
                }
            } label: {
                Label("LIVE_VIEW_TOOLBAR_SORT_BY_VIEWERS", systemImage: "person.3.sequence.fill")
            }
        } label: {
            Label("LIVE_VIEW_TOOLBAR_SORT", systemImage: "arrow.up.arrow.down")
        }
        .onChange(of: self.sortingStrategy, perform: { sortingSelection in
            self.liveViewModel.sortVideos(by: sortingSelection)
        })
    }
}
