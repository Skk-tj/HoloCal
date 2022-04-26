//
//  UpcomnigCardListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct UpcomingCardListView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @State var searchText: String = ""
    
    let upcoming: UpcomingViewModel
    
    var body: some View {
        List {
            if searchText.isEmpty {
                if favourited.count != 0 && upcoming.dataStatus == .success {
                    Section {
                        ForEach(upcoming.videoList.filter { video in
                            favourited.contains(where: { video.channel.id == $0 })
                        }) { live in
                            SwipableLinkedCellView(video: live) {
                                UpcomingPaneView(upcoming: live)
                            }
                            .contextMenu {
                                VideoContextMenu(video: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
                            }
                            .listRowSeparator(.hidden)
                        }
                    }
                }
                
                Section {
                    ForEach(upcoming.videoList.filter { video in
                        !favourited.contains(where: { video.channel.id == $0 })
                    }, id: \.self) { live in
                        SwipableLinkedCellView(video: live) {
                            UpcomingPaneView(upcoming: live)
                        }
                        .contextMenu {
                            VideoContextMenu(video: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
                        }
                        .listRowSeparator(.hidden)
                    }
                    HStack {
                        Spacer()
                        DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                            Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(upcoming.videoList.count) \(getUpcomingStreamLookAheadHoursFromUserDefaults())")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .listRowSeparator(.hidden)
                }
            } else {
                SearchSectionView(viewModel: upcoming, searchText: searchText, cellView: { live in
                    SwipableLinkedCellView(video: live) {
                        UpcomingPaneView(upcoming: live)
                    }
                    .contextMenu {
                        VideoContextMenu(video: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
                    }
                    .listRowSeparator(.hidden)
                })
            }
        }
        .listStyle(.plain)
        .searchable(text: $searchText, prompt: "SEARCH_BY_NAME_OR_TAG") {
            if searchText.isEmpty {
                ForEach(upcoming.getSearchSuggestions(), id: \.self) { suggestion in
                    Text("\(suggestion)").searchCompletion(suggestion)
                }
            }
        }
    }
}

//struct UpcomnigCardListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomnigCardListView()
//    }
//}
