//
//  UpcomingViewToolbar.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView) var isShowingAbsoluteTime: Bool = false
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompact: Bool = false
    @AppStorage(UserDefaultKeys.isShowingOnlyFavouritesInUpcomingView) var isShowingOnlyFavourites: Bool = false
    
    /// Defines the current sorting strategy.
    /// - Note: `sortingStrategy` is of `@Binding` here because the parent views need to control it upon refresh of content.
    @Binding var sortingStrategy: SortingStrategy
    
    @EnvironmentObject var upcomingViewModel: VideoViewModel
    
    var body: some View {
        Menu {
            Section {
                Toggle(isOn: $isShowingAbsoluteTime, label: {
                    Label("LIVE_VIEW_TOOLBAR_SHOW_ABSOLUTE", systemImage: "clock")
                })
                
                Toggle(isOn: $isShowingOnlyFavourites, label: {
                    Label("LIVE_VIEW_TOOLBAR_FAVOURITES_ONLY", systemImage: "star")
                })
                
                if UIDevice.current.userInterfaceIdiom == .phone {
                    Button {
                        isShowingCompact.toggle()
                        UserDefaults.standard.set(isShowingCompact, forKey: UserDefaultKeys.isShowingCompactInUpcomingView)
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

//struct UpcomingViewToolbar_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingViewToolbar()
//    }
//}
