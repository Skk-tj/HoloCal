//
//  VideoViewToolbar.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoViewToolbar: View {
    @EnvironmentObject var viewModel: VideoViewModel
    @Binding var currentPresentationMode: PresentationMode
    
    @AppStorage var isShowingCompact: Bool
    @AppStorage var isShowingAbsoluteTime: Bool
    
    let videoType: VideoType
    
    init(currentPresentationMode: Binding<PresentationMode>, videoType: VideoType) {
        self.videoType = videoType
        self._currentPresentationMode = Binding(projectedValue: currentPresentationMode)
        
        switch videoType {
        case .live:
            _isShowingCompact = AppStorage(wrappedValue: false, UserDefaultKeys.isShowingCompactInLiveView)
            _isShowingAbsoluteTime = AppStorage(wrappedValue: false, UserDefaultKeys.isShowingAbsoluteTimeInLiveView)
        case .upcoming:
            _isShowingCompact = AppStorage(wrappedValue: false, UserDefaultKeys.isShowingCompactInUpcomingView)
            _isShowingAbsoluteTime = AppStorage(wrappedValue: false, UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView)
        case .past:
            _isShowingCompact = AppStorage(wrappedValue: false, UserDefaultKeys.isShowingCompactInPastView)
            _isShowingAbsoluteTime = AppStorage(wrappedValue: false, UserDefaultKeys.isShowingAbsoluteTimeInPastView)
        }
    }
    
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
            if UIDevice.current.userInterfaceIdiom == .phone {
                Picker("Order", selection: $viewModel.sortingStrategy) {
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_GENERATION", systemImage: "person.3.fill").tag(SortingStrategy.notSorting)
                }
            }
            
            switch videoType {
            case .live:
                Menu {
                    Picker("Order", selection: $viewModel.sortingStrategy) {
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_NEAREST_TO_FURTHEST", systemImage: "hourglass.tophalf.filled").tag(SortingStrategy.timeDesc)
                        Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME_FURTHEST_TO_NEAREST", systemImage: "hourglass.bottomhalf.filled").tag(SortingStrategy.timeAsc)
                    }
                } label: {
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME", systemImage: "clock")
                }
            case .upcoming:
                Menu {
                    Picker("Order", selection: $viewModel.sortingStrategy) {
                        Label("UPCOMING_VIEW_TOOLBAR_SORT_BY_START_TIME_NEAREST_TO_FURTHEST", systemImage: "hourglass.tophalf.filled").tag(SortingStrategy.timeAsc)
                        Label("UPCOMING_VIEW_TOOLBAR_SORT_BY_START_TIME_FURTHEST_TO_NEAREST", systemImage: "hourglass.bottomhalf.filled").tag(SortingStrategy.timeDesc)
                    }
                } label: {
                    Label("LIVE_VIEW_TOOLBAR_SORT_BY_START_TIME", systemImage: "clock")
                }
            case .past:
                Menu {
                    Picker("Order", selection: $viewModel.sortingStrategy) {
                        Label("PAST_VIEW_TOOLBAR_SORT_BY_ENDED_TIME_NEAREST_TO_FURTHEST", systemImage: "hourglass.tophalf.filled").tag(SortingStrategy.endedFirst)
                        Label("PAST_VIEW_TOOLBAR_SORT_BY_ENDED_TIME_FURTHEST_TO_NEAREST", systemImage: "hourglass.bottomhalf.filled").tag(SortingStrategy.endedLast)
                    }
                } label: {
                    Label("PAST_VIEW_TOOLBAR_SORT_BY_END_TIME", systemImage: "clock")
                }
            }
            
            if videoType == .live {
                Menu {
                    Picker("Order", selection: $viewModel.sortingStrategy) {
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
            }
        } label: {
            Label("LIVE_VIEW_TOOLBAR_SORT", systemImage: "arrow.up.arrow.down")
        }
        .onChange(of: viewModel.sortingStrategy, perform: { sortingSelection in
            if sortingSelection == .notSorting {
                currentPresentationMode = .normal
            } else {
                currentPresentationMode = .sorting
            }
            
            self.viewModel.sortVideos()
        })
    }
}
