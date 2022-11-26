//
//  iPadLazyGridView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct iPadLazyGridView<VideoContent: View, DataStatusView: View>: View {
    @EnvironmentObject var videoViewModel: VideoViewModel
    
    @AppStorage(UserDefaultKeys.isShowingDSTReminder) var isShowingDSTReminder = false
    
    @State var searchText: String = ""
    
    @ViewBuilder let singleVideoView: (_ live: LiveVideo) -> VideoContent
    @ViewBuilder let dataStatusView: () -> DataStatusView
    
    let isFavourite: Bool
    
    let layout = [
        GridItem(.adaptive(minimum: 300), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            if let nextDSTTransition = TimeZone.current.nextDaylightSavingTimeTransition {
                if let days = Calendar.current.dateComponents([.day], from: Date(), to: nextDSTTransition).day {
                    if isShowingDSTReminder {
                        DSTReminderView(numberOfDaysToChange: days, changeType: TimeZone.current.isDaylightSavingTime() ? .ending : .starting, isShowingDSTReminder: $isShowingDSTReminder)
                            .padding(.horizontal, 30)
                    }
                }
            }
            
            LazyVGrid(columns: layout, spacing: 30) {
                if searchText.isEmpty {
                    if isFavourite {
                        ForEachVideoView { live in
                            singleVideoView(live)
                        }
                    } else {
                        GenerationFilteredForEachVideoView { live in
                            singleVideoView(live)
                        }
                    }
                } else {
                    SearchSectionView(searchText: searchText) { live in
                        singleVideoView(live)
                    }
                }
            }
            .padding(30)
            
            dataStatusView()
        }
        .searchable(text: $searchText, prompt: "SEARCH_BY_NAME_OR_TAG") {
            if searchText.isEmpty {
                ForEach(videoViewModel.getSearchSuggestions(), id: \.self) { suggestion in
                    HStack {
                        switch suggestion.category {
                        case .name:
                            Image(systemName: "person")
                        case .tag:
                            Image(systemName: "tag")
                        }
                        
                        Text("\(suggestion.searchText)")
                    }
                    .searchCompletion(suggestion.searchText)
                }
            }
        }
    }
}
