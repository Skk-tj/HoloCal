//
//  UpcomingFavouritesViewToolbar.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingFavouritesViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView) var isShowingAbsoluteTime: Bool = false
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingFavouritesView) var isShowingCompact: Bool = false
    
    @EnvironmentObject var upcomingViewModel: VideoViewModel
    
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
                Picker("Order", selection: $upcomingViewModel.sortingStrategy) {
                    Label("UPCOMING_VIEW_TOOLBAR_SORT_BY_START_TIME_NEAREST_TO_FURTHEST", systemImage: "hourglass.tophalf.filled").tag(SortingStrategy.timeAsc)
                    Label("UPCOMING_VIEW_TOOLBAR_SORT_BY_START_TIME_FURTHEST_TO_NEAREST", systemImage: "hourglass.bottomhalf.filled").tag(SortingStrategy.timeDesc)
                }
            } label: {
                Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME", systemImage: "clock")
            }
        } label: {
            Label("LIVE_VIEW_TOOLBAR_SORT", systemImage: "arrow.up.arrow.down")
        }
        .onChange(of: upcomingViewModel.sortingStrategy, perform: { sortingSelection in
            self.upcomingViewModel.sortVideos()
        })
    }
}
