//
//  LiveViewToolbar.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInLiveView) var isShowingAbsoluteTime: Bool = false
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompact: Bool = false
    
    @Binding var currentPresentationMode: PresentationMode
    
    @EnvironmentObject var liveViewModel: VideoViewModel
    
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
            Picker("Order", selection: $liveViewModel.sortingStrategy) {
                Label(UIDevice.current.userInterfaceIdiom == .phone ? "LIVE_VIEW_TOOLBAR_SORT_BY_GENERATION" : "LIVE_VIEW_TOOLBAR_SORT_BY_GENERATION_IPAD", systemImage: "person.3.fill").tag(SortingStrategy.notSorting)
            }
            
            Menu {
                Picker("Order", selection: $liveViewModel.sortingStrategy) {
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_NEAREST_TO_FURTHEST", systemImage: "hourglass.tophalf.filled").tag(SortingStrategy.timeDesc)
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_FURTHEST_TO_NEAREST", systemImage: "hourglass.bottomhalf.filled").tag(SortingStrategy.timeAsc)
                }
            } label: {
                Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME", systemImage: "clock")
            }
            
            Menu {
                Picker("Order", selection: $liveViewModel.sortingStrategy) {
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
        .onChange(of: liveViewModel.sortingStrategy, perform: { sortingSelection in
            if sortingSelection == .notSorting {
                currentPresentationMode = .normal
            } else {
                currentPresentationMode = .sorting
            }
            
            self.liveViewModel.sortVideos()
        })
    }
}
