//
//  LiveViewToolbar.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-25.
//

import SwiftUI

struct LiveViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInLiveView) var isShowingAbsoluteTime: Bool = false
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompactInLiveView: Bool = false
    
    @State var sortingSelection: SortingStrategy = .time(.desc)
    @ObservedObject var liveViewModel: LiveViewModel
    
    var body: some View {
        Menu {
            Button {
                isShowingAbsoluteTime.toggle()
                UserDefaults.standard.set(isShowingAbsoluteTime, forKey: UserDefaultKeys.isShowingAbsoluteTimeInLiveView)
            } label: {
                Label(isShowingAbsoluteTime ? "LIVE_VIEW_TOOLBAR_SHOW_RELATIVE" : "LIVE_VIEW_TOOLBAR_SHOW_ABSOLUTE", systemImage: "clock")
            }
            
            if UIDevice.current.userInterfaceIdiom == .phone {
                Button {
                    isShowingCompactInLiveView.toggle()
                    UserDefaults.standard.set(isShowingCompactInLiveView, forKey: UserDefaultKeys.isShowingCompactInLiveView)
                } label: {
                    Label(isShowingCompactInLiveView ? "LIVE_VIEW_TOOLBAR_SHOW_CARD" : "LIVE_VIEW_TOOLBAR_SHOW_COMPACT", systemImage: isShowingCompactInLiveView ? "rectangle.grid.1x2" : "list.bullet")
                }
            }
            
            Menu {
                Menu {
                    Picker("Order", selection: $sortingSelection) {
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_NEAREST_TO_FURTHEST", systemImage: "arrow.down").tag(SortingStrategy.time(.desc))
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_FURTHEST_TO_NEAREST", systemImage: "arrow.up").tag(SortingStrategy.time(.asc))
                    }
                } label: {
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME", systemImage: "clock")
                }
                
                Menu {
                    Picker("Order", selection: $sortingSelection) {
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_VIEWERS_ASCENDING", systemImage: "arrow.up").tag(SortingStrategy.viewers(.asc))
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_VIEWERS_DESCENDING", systemImage: "arrow.down").tag(SortingStrategy.viewers(.desc))
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
        .onChange(of: sortingSelection, perform: { sortingSelection in
            self.liveViewModel.sortVideos(by: sortingSelection)
        })
    }
}

//struct LiveViewToolbar_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveViewToolbar()
//    }
//}
