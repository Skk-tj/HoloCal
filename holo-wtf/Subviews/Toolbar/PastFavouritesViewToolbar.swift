//
//  PastFavouritesViewToolbar.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastFavouritesViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInPastView) var isShowingAbsoluteTime: Bool = false
    @AppStorage(UserDefaultKeys.isShowingCompactInPastView) var isShowingCompact: Bool = false
    
    @EnvironmentObject var pastViewModel: VideoViewModel
    
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
                Picker("Order", selection: $pastViewModel.sortingStrategy) {
                    Label("PAST_VIEW_TOOLBAR_SORT_BY_ENDED_TIME_NEAREST_TO_FURTHEST", systemImage: "hourglass.tophalf.filled").tag(SortingStrategy.endedFirst)
                    Label("PAST_VIEW_TOOLBAR_SORT_BY_ENDED_TIME_FURTHEST_TO_NEAREST", systemImage: "hourglass.bottomhalf.filled").tag(SortingStrategy.endedLast)
                }
            } label: {
                Label("PAST_VIEW_TOOLBAR_SORT_BY_END_TIME", systemImage: "clock")
            }
        } label: {
            Label("LIVE_VIEW_TOOLBAR_SORT", systemImage: "arrow.up.arrow.down")
        }
        .onChange(of: pastViewModel.sortingStrategy) {_ in
            self.pastViewModel.sortVideos()
        }
    }
}
