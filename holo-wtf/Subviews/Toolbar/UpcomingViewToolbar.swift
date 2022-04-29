//
//  UpcomingViewToolbar.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView) var isShowingAbsoluteTime: Bool = false
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = false
    
    @State var sortingSelection: SortingStrategy = .time(.asc)
    @ObservedObject var upcomingViewModel: UpcomingViewModel
    
    var body: some View {
        Menu {
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
            
            Menu {
                Menu {
                    Picker("Order", selection: $sortingSelection) {
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_NEAREST_TO_FURTHEST", systemImage: "arrow.down").tag(SortingStrategy.time(.asc))
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_FURTHEST_TO_NEAREST", systemImage: "arrow.up").tag(SortingStrategy.time(.desc))
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
        })
    }
}

//struct UpcomingViewToolbar_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingViewToolbar()
//    }
//}
