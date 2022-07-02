//
//  UpcomingViewToolbar.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-09.
//

import SwiftUI

struct UpcomingViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView) var isShowingAbsoluteTime: Bool = false
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = false
    
    /// Defines the current sorting strategy.
    /// - Note: `sortingSelection` is of `@Binding` here because the parent views need to control it upon refresh of content.
    @Binding var sortingSelection: SortingStrategy
    /// Defines if current view is in sorting mode or not.
    /// - Note: `isSorting` is of `@Binding` here because the parent views needs to use it to control whether to display in sectioned mode or not.
    @Binding var isSorting: Bool
    
    @EnvironmentObject var upcomingViewModel: VideoViewModel
    
    var body: some View {
        
        
        Menu {
            Section {
                Button {
                    isShowingAbsoluteTime.toggle()
                    UserDefaults.standard.set(isShowingAbsoluteTime, forKey: UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView)
                } label: {
                    Label(isShowingAbsoluteTime ? "LIVE_VIEW_TOOLBAR_SHOW_RELATIVE" : "LIVE_VIEW_TOOLBAR_SHOW_ABSOLUTE", systemImage: "clock")
                }
                
                if UIDevice.current.userInterfaceIdiom == .phone {
                    Button {
                        isShowingCompactInUpcomingView.toggle()
                        UserDefaults.standard.set(isShowingCompactInUpcomingView, forKey: UserDefaultKeys.isShowingCompactInUpcomingView)
                    } label: {
                        Label(isShowingCompactInUpcomingView ? "LIVE_VIEW_TOOLBAR_SHOW_CARD" : "LIVE_VIEW_TOOLBAR_SHOW_COMPACT", systemImage: isShowingCompactInUpcomingView ? "rectangle.grid.1x2" : "list.bullet")
                    }
                }
            }
            
            Menu {
                Menu {
                    Picker("Order", selection: $sortingSelection) {
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
        .onChange(of: sortingSelection, perform: { sortingSelection in
            self.upcomingViewModel.sortVideos(by: sortingSelection)
            isSorting = true
        })
    }
}

//struct UpcomingViewToolbar_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingViewToolbar()
//    }
//}
