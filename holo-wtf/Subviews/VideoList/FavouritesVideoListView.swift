//
//  FavouritesVideoListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-20.
//

import SwiftUI

struct FavouritesVideoListView<VideoContent: View, DataStatusContent: View>: View {
    @AppStorage(UserDefaultKeys.isShowingDSTReminder) var isShowingDSTReminder = false
    
    /// Defines the current sorting strategy
    @EnvironmentObject var viewModel: VideoViewModel
    
    @State var searchText: String = ""
    
    /// The view of a single video.
    @ViewBuilder let singleVideoView: (_ live: LiveVideo) -> VideoContent
    
    /// The view of the counter at the bottom.
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        List {
            if let nextDSTTransition = TimeZone.current.nextDaylightSavingTimeTransition {
                if let days = Calendar.current.dateComponents([.day], from: Date(), to: nextDSTTransition).day {
                    if isShowingDSTReminder {
                        DSTReminderView(numberOfDaysToChange: days, changeType: TimeZone.current.isDaylightSavingTime() ? .ending : .starting, isShowingDSTReminder: $isShowingDSTReminder)
                            .listRowSeparator(.hidden)
                    }
                }
            }
            
            if searchText.isEmpty {
                ForEachVideoView(cellView: { video in
                    singleVideoView(video)
                })
            } else {
                SearchSectionView(searchText: searchText, cellView: { video in
                    singleVideoView(video)
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

//struct FavouritesVideoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouritesVideoListView()
//    }
//}
