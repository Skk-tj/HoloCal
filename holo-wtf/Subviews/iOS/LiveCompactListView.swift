//
//  LiveCompactListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct LiveCompactListView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @State var searchText: String = ""
    
    let live: LiveViewModel
    
    var body: some View {
        List {
            if searchText.isEmpty {
                if favourited.count != 0 && live.dataStatus == .success {
                    Section {
                        FavouritedForEachView(viewModel: live, cellView: { live in
                            SwipableLinkedCellView(video: live) {
                                LiveCellView(live: live, twitterLink: self.live.twitterList[live.channel.id] ?? nil)
                            }
                        })
                    }
                }
                
                Section {
                    NotFavouritedForEachView(viewModel: live, cellView: { live in
                        SwipableLinkedCellView(video: live) {
                            LiveCellView(live: live, twitterLink: self.live.twitterList[live.channel.id] ?? nil)
                        }
                    })
                    
                    HStack {
                        Spacer()
                        DataStatusIndicatorView(dataStatus: live.dataStatus) {
                            Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count)")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                }
            } else {
                SearchSectionView(viewModel: live, searchText: searchText, cellView: { live in
                    SwipableLinkedCellView(video: live) {
                        LiveCellView(live: live, twitterLink: self.live.twitterList[live.channel.id] ?? nil)
                    }
                })
            }
        }
        .searchable(text: $searchText, prompt: "SEARCH_BY_NAME_OR_TAG") {
            if searchText.isEmpty {
                ForEach(live.getSearchSuggestions(), id: \.self) { suggestion in
                    Text("\(suggestion)").searchCompletion(suggestion)
                }
            }
        }
    }
}

//struct LiveCompactListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveCompactListView()
//    }
//}
