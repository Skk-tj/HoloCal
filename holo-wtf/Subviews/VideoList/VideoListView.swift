//
//  VideoListView.swift
//  holo-wtf
//
//
//

import SwiftUI

/// The view that represents a general list of videos.
struct VideoListView<VideoContent: View, DataStatusContent: View>: View {
    @AppStorage(UserDefaultKeys.isShowingDSTReminder) var isShowingDSTReminder = false
    
    @EnvironmentObject var viewModel: VideoViewModel
    
    @State var searchText: String = ""
    @Binding var currentPresentationMode: PresentationMode
    let isFavourite: Bool
    
    /// The view of a single video.
    @ViewBuilder let singleVideoView: (_ live: LiveVideo) -> VideoContent
    
    /// The view of the counter at the bottom.
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        return List {
            if let nextDSTTransition = TimeZone.current.nextDaylightSavingTimeTransition {
                if let days = Calendar.current.dateComponents([.day], from: Date(), to: nextDSTTransition).day {
                    if isShowingDSTReminder {
                        DSTReminderView(numberOfDaysToChange: days, changeType: TimeZone.current.isDaylightSavingTime() ? .ending : .starting, isShowingDSTReminder: $isShowingDSTReminder)
                            .listRowSeparator(.hidden)
                            .listRowBackground(EmptyView())
                    }
                }
            }
            
            if searchText.isEmpty {
                if isFavourite {
                    ForEachVideoView(cellView: { video in
                        singleVideoView(video)
                    })
                } else {
                    switch currentPresentationMode {
                    case .normal:
                        SectionedForEachView(cellView: { live in
                            singleVideoView(live)
                        })
                    case .sorting:
                        GenerationFilteredForEachVideoView(cellView: { live in
                            singleVideoView(live)
                        })
                    }
                }
            } else {
                SearchSectionView(searchText: searchText, cellView: { live in
                    singleVideoView(live)
                })
            }
            
            HStack {
                Spacer()
                dataStatusView()
                Spacer()
            }
            .listRowSeparator(.hidden)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "SEARCH_BY_NAME_OR_TAG") {
            if searchText.isEmpty {
                ForEach(viewModel.getSearchSuggestions(), id: \.self) { suggestion in
                    switch suggestion.category {
                    case .name:
                        Label(suggestion.searchText, systemImage: "person")
                            .searchCompletion(suggestion.searchText)
                    case .tag:
                        Label(suggestion.searchText, systemImage: "tag")
                            .searchCompletion(suggestion.searchText)
                    }
                }
            }
        }
    }
}
