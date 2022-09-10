//
//  iPadLazyGirdView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct iPadLazyGirdView<VideoContent: View, DataStatusView: View>: View {
    @EnvironmentObject var videoViewModel: VideoViewModel
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage("generationListSelection") var generationListSelection = Set(GenerationEnum.allCases)
    @AppStorage(UserDefaultKeys.isShowingDSTReminder) var isShowingDSTReminder = false
    
    @State var searchText: String = ""
    
    @ViewBuilder let singleVideoView: (_ live: LiveVideo) -> VideoContent
    @ViewBuilder let dataStatusView: () -> DataStatusView
    
    let layout = [
        GridItem(.adaptive(minimum: 300), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            if let nextDSTTransition = TimeZone.current.nextDaylightSavingTimeTransition {
                if let days = Calendar.current.dateComponents([.day], from: Date(), to: nextDSTTransition).day {
                    if isShowingDSTReminder {
                        DSTReminderView(numberOfDaysToChange: days, changeType: TimeZone.current.isDaylightSavingTime() ? .ending : .starting)
                            .padding(.horizontal, 30)
                    }
                }
            }
            
            LazyVGrid(columns: layout, spacing: 50) {
                if searchText.isEmpty {
                    if videoViewModel.videoList.filter { video in favourited.contains(where: { video.channel.id == $0 })}.count != 0 && videoViewModel.dataStatus == .success {
                        FavouritedForEachView(cellView: { live in
                            singleVideoView(live)
                        })
                    }
                    
                    NotFavouritedForEachView(cellView: { live in
                        singleVideoView(live)
                    })
                } else {
                    SearchForEachView(searchText: searchText, cellView: { live in
                        LinkedVideoView(url: live.url) {
                            singleVideoView(live)
                        }
                        .contextMenu {
                            VideoContextMenu(video: live)
                        }
                    })
                }
            }
            .padding(30)
            
            Divider()
                .padding(.horizontal)
            
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

//struct iPadLazyGirdView_Previews: PreviewProvider {
//    static var previews: some View {
//        iPadLazyGirdView()
//    }
//}
