//
//  UpcomingFavouritesViewToolbar.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-20.
//

import SwiftUI

struct UpcomingFavouritesViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingFavouritesView) var isShowingAbsoluteTime: Bool = false
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingFavouritesView) var isShowingCompact: Bool = false
    
    @State var sortingStrategy: SortingStrategy = .timeAsc
    
    @EnvironmentObject var upcomingViewModel: VideoViewModel
    
    var body: some View {
        Menu {
            Section {
                Toggle(isOn: $isShowingAbsoluteTime, label: {
                    Label("LIVE_VIEW_TOOLBAR_SHOW_ABSOLUTE", systemImage: "clock")
                })
                
                if UIDevice.current.userInterfaceIdiom == .phone {
                    Button {
                        isShowingCompact.toggle()
                        UserDefaults.standard.set(isShowingCompact, forKey: UserDefaultKeys.isShowingCompactInUpcomingFavouritesView)
                    } label: {
                        Label(isShowingCompact ? "LIVE_VIEW_TOOLBAR_SHOW_CARD" : "LIVE_VIEW_TOOLBAR_SHOW_COMPACT", systemImage: isShowingCompact ? "rectangle.grid.1x2" : "list.bullet")
                    }
                }
            }
            
            Menu {
                Menu {
                    Picker("Order", selection: $sortingStrategy) {
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_NEAREST_TO_FURTHEST", systemImage: "arrow.down").tag(SortingStrategy.timeAsc)
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_FURTHEST_TO_NEAREST", systemImage: "arrow.up").tag(SortingStrategy.timeDesc)
                    }
                } label: {
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME", systemImage: "clock")
                }
            } label: {
                Label("LIVE_VIEW_TOOLBAR_SORT", systemImage: "arrow.up.arrow.down")
            }
        } label: {
            Label("Display Settings", systemImage: "ellipsis")
        }
        .onChange(of: sortingStrategy, perform: { sortingSelection in
            self.upcomingViewModel.sortVideos(by: sortingSelection)
        })
    }
}
