//
//  iPadLazyGirdView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct iPadLazyGirdView<VideoContent: View, CountContent: View>: View {
    @EnvironmentObject var videoViewModel: VideoViewModel
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage("generationListSelection") var generationListSelection = Set(GenerationEnum.allCases)
    
    @State var searchText: String = ""
    
    @ViewBuilder let singleVideoView: (_ live: LiveVideo) -> VideoContent
    @ViewBuilder let countView: () -> CountContent
    
    let layout = [
        GridItem(.adaptive(minimum: 300), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            switch videoViewModel.dataStatus {
            case .working:
                ProgressView()
            case .fail:
                Spacer()
                Label("FAILED_TO_RETRIEVE_NEW_DATA", systemImage: "exclamationmark.circle.fill")
                    .foregroundColor(.secondary)
                Spacer()
            case .success:
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
                
                countView()
            }
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
