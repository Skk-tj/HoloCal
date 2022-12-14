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
    
    @Binding var currentPresentationMode: PresentationMode
    
    /// Defines the current sorting strategy.
    @State var sortingStrategy: SortingStrategy = .notSorting
    
    @EnvironmentObject var upcomingViewModel: VideoViewModel
    
    var body: some View {
        Section {
            Toggle(isOn: $isShowingAbsoluteTime, label: {
                Label("LIVE_VIEW_TOOLBAR_SHOW_ABSOLUTE", systemImage: "clock")
            })
            
            if UIDevice.current.userInterfaceIdiom == .phone {
                Button {
                    isShowingCompact.toggle()
                    currentPresentationMode = .normal
                } label: {
                    Label(isShowingCompact ? "LIVE_VIEW_TOOLBAR_SHOW_CARD" : "LIVE_VIEW_TOOLBAR_SHOW_COMPACT", systemImage: isShowingCompact ? "rectangle.grid.1x2" : "list.bullet")
                }
            }
        }
        
        Menu {
            Picker("Order", selection: $sortingStrategy) {
                Label(UIDevice.current.userInterfaceIdiom == .phone ? "LIVE_VIEW_TOOLBAR_SORT_BY_GENERATION" : "LIVE_VIEW_TOOLBAR_SORT_BY_GENERATION_IPAD", systemImage: "person.fill").tag(SortingStrategy.notSorting)
            }
            
            Menu {
                Picker("Order", selection: $sortingStrategy) {
                    Label("UPCOMING_VIEW_TOOLBAR_SORT_BY_START_TIME_NEAREST_TO_FURTHEST", systemImage: "hourglass.tophalf.filled").tag(SortingStrategy.timeAsc)
                    Label("UPCOMING_VIEW_TOOLBAR_SORT_BY_START_TIME_FURTHEST_TO_NEAREST", systemImage: "hourglass.bottomhalf.filled").tag(SortingStrategy.timeDesc)
                }
            } label: {
                Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME", systemImage: "clock")
            }
        } label: {
            Label("LIVE_VIEW_TOOLBAR_SORT", systemImage: "arrow.up.arrow.down")
        }
        .onChange(of: sortingStrategy, perform: { sortingSelection in
            if sortingSelection == .notSorting {
                currentPresentationMode = .normal
            } else {
                currentPresentationMode = .sorting
            }
            
            self.upcomingViewModel.sortVideos(by: sortingSelection)
        })
    }
}
