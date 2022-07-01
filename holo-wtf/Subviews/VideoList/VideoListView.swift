//
//  VideoListView.swift
//  holo-wtf
//
//
//

import SwiftUI

/// The view that represents a general list of videos.
struct VideoListView<VideoContent: View, DataStatusContent: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    @EnvironmentObject var viewModel: VideoViewModel
    
    @State var searchText: String = ""
    @Binding var isSorting: Bool
    
    /// The view of a single video.
    @ViewBuilder let singleVideoView: (_ live: LiveVideo) -> VideoContent
    
    /// The view of the counter at the bottom.
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        List {
            if searchText.isEmpty {
                if viewModel.videoList.filter { video in favourited.contains(where: { video.channel.id == $0 })}.count != 0 && viewModel.dataStatus == .success {
                    Section(header: Text("LIVE_VIEW_FAVOURITE_SECTION_TITLE")) {
                        FavouritedForEachView(cellView: { live in
                            singleVideoView(live)
                        })
                    }
                    .headerProminence(.increased)
                }
                
                if isSorting {
                    NotFavouritedForEachView(cellView: { live in
                        singleVideoView(live)
                    })
                } else {
                    SectionedNotFavouritedForEachView(cellView: { live in
                        singleVideoView(live)
                    })
                }
                
                Section {
                    HStack {
                        Spacer()
                        dataStatusView()
                        Spacer()
                    }
                }
            } else {
                SearchSectionView(searchText: searchText, cellView: { live in
                    singleVideoView(live)
                })
            }
        }
        .searchable(text: $searchText, prompt: "SEARCH_BY_NAME_OR_TAG") {
            if searchText.isEmpty {
                ForEach(viewModel.getSearchSuggestions(), id: \.self) { suggestion in
                    Text("\(suggestion)").searchCompletion(suggestion)
                }
            }
        }
    }
}

//struct VideoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoListView()
//    }
//}
