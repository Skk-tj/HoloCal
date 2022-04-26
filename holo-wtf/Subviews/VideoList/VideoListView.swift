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
                if favourited.count != 0 && viewModel.dataStatus == .success {
                    Section {
                        FavouritedForEachView(viewModel: viewModel, cellView: { live in
                            singleVideoView(live)
                        })
                    }
                }
                
                Section {
                    NotFavouritedForEachView(viewModel: viewModel, cellView: { live in
                        singleVideoView(live)
                    })
                    
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
