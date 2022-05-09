//
//  UpcomingiPadView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-23.
//

import SwiftUI

struct UpcomingiPadView: View {
    @StateObject var upcoming: UpcomingViewModel
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage("generationListSelection") var generationListSelection = Set(GenerationEnum.allCases)
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var upcomingLookAhead = 48
    
    @State var searchText: String = ""
    
    @State var sortingSelection: SortingStrategy? = nil
    @State var isSorting: Bool = false
    
    
    let layout = [
        GridItem(.adaptive(minimum: 300), spacing: 10)
    ]
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        ScrollView {
            if (upcoming.dataStatus == .working) {
                ProgressView()
            } else if (upcoming.dataStatus == .fail) {
                Spacer()
                Label("FAILED_TO_RETRIEVE_NEW_DATA", systemImage: "exclamationmark.circle.fill")
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                LazyVGrid(columns: layout, spacing: 50) {
                    if searchText.isEmpty {
                        FavouritedForEachView(cellView: { live in
                            LinkedVideoView(url: live.url) {
                                UpcomingPaneView(upcoming: live)
                            }
                            .contextMenu {
                                VideoContextMenu(video: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
                            }
                        })
                        
                        NotFavouritedForEachView(cellView: { live in
                            LinkedVideoView(url: live.url) {
                                UpcomingPaneView(upcoming: live)
                            }
                            .contextMenu {
                                VideoContextMenu(video: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
                            }
                        })
                    } else {
                        SearchForEachView(searchText: searchText, cellView: { live in
                            LinkedVideoView(url: live.url) {
                                UpcomingPaneView(upcoming: live)
                            }
                            .contextMenu {
                                VideoContextMenu(video: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
                            }
                        })
                    }
                }
                .padding(30)
                
                Divider()
                    .padding(.horizontal)
                
                let filteredVideoCount = upcoming.videoList.filter { video in
                    !generationListSelection.contains(video.channel.talent.inGeneration)
                }
                    .count
                
                if filteredVideoCount == 0 {
                    Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(upcoming.videoList.count) \(upcomingLookAhead)")
                        .foregroundColor(.secondary)
                        .padding(.bottom, 30)
                } else {
                    Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(upcoming.videoList.count) \(upcomingLookAhead) \(filteredVideoCount)")
                        .foregroundColor(.secondary)
                        .padding(.bottom, 30)
                }
            }
        }
        .environmentObject(upcoming as VideoViewModel)
        .task {
            await upcoming.getUpcoming()
            
            // Reset sorting state, go back to section view
            isSorting = false
            sortingSelection = nil
        }
        .searchable(text: $searchText, prompt: "SEARCH_BY_NAME_OR_TAG") {
            if searchText.isEmpty {
                ForEach(upcoming.getSearchSuggestions(), id: \.self) { suggestion in
                    Text("\(suggestion)").searchCompletion(suggestion)
                }
            }
        }
        .toolbar {
            ToolbarItemGroup {
                UpcomingViewToolbar(sortingSelection: $sortingSelection, isSorting: $isSorting)
                    .environmentObject(upcoming as VideoViewModel)
                Button(action: {
                    Task {
                        await upcoming.getUpcoming()
                        
                        // Reset sorting state, go back to section view
                        isSorting = false
                        sortingSelection = nil
                    }
                }, label: {
                    Label("Refresh", systemImage: "arrow.triangle.2.circlepath")
                })
            }
        }
        .navigationTitle("UPCOMING_VIEW_TITLE")
    }
}

struct UpcomingiPadView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingiPadView()
    }
}
