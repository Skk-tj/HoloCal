//
//  VideoListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-26.
//

import SwiftUI


/// The view that represents a general list of videos.
struct VideoListView<VideoContent: View, DataStatusContent: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    @AppStorage(UserDefaultKeys.isShowingDSTReminder) var isShowingDSTReminder = false
    
    @EnvironmentObject var viewModel: VideoViewModel
    
    @State var searchText: String = ""
    @Binding var currentPresentationMode: PresentationMode
    
    /// The view of a single video.
    @ViewBuilder let singleVideoView: (_ live: LiveVideo) -> VideoContent
    
    /// The view of the counter at the bottom.
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        if !searchText.isEmpty {
            currentPresentationMode = .searching
        }
        
        let isThereFavouriteToShow = viewModel.videoList.filter { video in favourited.contains(where: { video.channel.id == $0 })}.count != 0 && viewModel.dataStatus == .success
        
        return List {
            if let nextDSTTransition = TimeZone.current.nextDaylightSavingTimeTransition {
                if let days = Calendar.current.dateComponents([.day], from: Date(), to: nextDSTTransition).day {
                    if isShowingDSTReminder {
                        DSTReminderView(numberOfDaysToChange: days, changeType: TimeZone.current.isDaylightSavingTime() ? .ending : .starting)
                            .listRowSeparator(.hidden)
                    }
                }
            }
            
            switch currentPresentationMode {
            case .normal:
                if isThereFavouriteToShow {
                    Section(header: Text("LIVE_VIEW_FAVOURITE_SECTION_TITLE")) {
                        FavouritedForEachView(cellView: { live in
                            singleVideoView(live)
                        })
                    }
                    .headerProminence(.increased)
                }
                
                SectionedNotFavouritedForEachView(cellView: { live in
                    singleVideoView(live)
                })
            case .searching:
                SearchSectionView(searchText: searchText, cellView: { live in
                    singleVideoView(live)
                })
            case .sorting:
                NotFavouritedForEachView(cellView: { live in
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
                    HStack {
                        switch suggestion.category {
                        case .name:
                            Image(systemName: "person")
                        case .tag:
                            Image(systemName: "tag")
                        }
                        
                        Text("\(suggestion.searchText)").searchCompletion(suggestion.searchText)
                    }
                }
            }
        }
    }
}
