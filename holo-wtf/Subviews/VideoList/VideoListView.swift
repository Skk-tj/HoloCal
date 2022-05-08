//
//  VideoListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoListView<VideoContent: View, DataStatusContent: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    let viewModel: VideoViewModel
    
    @Binding var searchText: String
    @ViewBuilder let singleVideoView: (_ live: LiveVideo) -> VideoContent
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        List {
            if searchText.isEmpty {
                if viewModel.videoList.filter { video in favourited.contains(where: { video.channel.id == $0 })}.count != 0 && viewModel.dataStatus == .success {
                    Section(header: Text("LIVE_VIEW_FAVOURITE_SECTION_TITLE")) {
                        FavouritedForEachView(viewModel: viewModel, cellView: { live in
                            singleVideoView(live)
                        })
                    }
                }
                
                SectionedNotFavouritedForEachView(viewModel: viewModel, cellView: { live in
                    singleVideoView(live)
                })
                
                Section {
                    HStack {
                        Spacer()
                        dataStatusView()
                        Spacer()
                    }
                }
            } else {
                SearchSectionView(viewModel: viewModel, searchText: searchText, cellView: { live in
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
