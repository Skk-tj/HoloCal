//
//  LiveiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveiPadView: View {
    @StateObject var live: LiveViewModel
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage("generationListSelection") var generationListSelection = Set(GenerationEnum.allCases)
    
    @State var searchText: String = ""
    
    @State var sortingSelection: SortingStrategy? = nil
    @State var isSorting: Bool = false
    
    let layout = [
        GridItem(.adaptive(minimum: 300), spacing: 10)
    ]
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel())
    }
    
    var body: some View {
        ScrollView {
            if (live.dataStatus == .working) {
                ProgressView()
            } else if (live.dataStatus == .fail) {
                Spacer()
                Label("FAILED_TO_RETRIEVE_NEW_DATA", systemImage: "exclamationmark.circle.fill")
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                LazyVGrid(columns: layout, spacing: 50) {
                    if searchText.isEmpty {
                        //- MARK: Favourites Section
                        FavouritedForEachView(cellView: { live in
                            LinkedVideoView(url: live.url) {
                                LivePaneView(live: live)
                            }
                            .contextMenu {
                                VideoContextMenu(video: live)
                            }
                        })
                        
                        //- MARK: Not favourited
                        NotFavouritedForEachView(cellView: { live in
                            LinkedVideoView(url: live.url) {
                                LivePaneView(live: live)
                            }
                            .contextMenu {
                                VideoContextMenu(video: live)
                            }
                        })
                    } else {
                        SearchForEachView(searchText: searchText, cellView: { live in
                            LinkedVideoView(url: live.url) {
                                LivePaneView(live: live)
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
                
                let filteredVideoCount = live.videoList.filter { video in
                    !generationListSelection.contains(video.channel.talent.inGeneration)
                }
                    .count
                
                if filteredVideoCount == 0 {
                    Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count)")
                        .foregroundColor(.secondary)
                        .padding(.bottom, 30)
                } else {
                    Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count) \(filteredVideoCount)")
                        .foregroundColor(.secondary)
                        .padding(.bottom, 30)
                }
            }
        }
        .environmentObject(live as VideoViewModel)
        .task {
            await live.getLive()
            
            // Reset sorting state, go back to section view
            isSorting = false
            sortingSelection = nil
        }
        .navigationTitle("LIVE_VIEW_TITLE")
        .searchable(text: $searchText, prompt: "SEARCH_BY_NAME_OR_TAG") {
            if searchText.isEmpty {
                ForEach(live.getSearchSuggestions(), id: \.self) { suggestion in
                    Text("\(suggestion)").searchCompletion(suggestion)
                }
            }
        }
        .toolbar {
            ToolbarItemGroup {
                LiveViewToolbar(sortingSelection: $sortingSelection, isSorting: $isSorting)
                    .environmentObject(live as VideoViewModel)
                Button(action: {
                    Task {
                        await live.getLive()
                        
                        // Reset sorting state, go back to section view
                        isSorting = false
                        sortingSelection = nil
                    }
                }, label: {
                    Label("Refresh", systemImage: "arrow.triangle.2.circlepath")
                })
            }
        }
    }
}

struct LiveiPadView_Previews: PreviewProvider {
    static var previews: some View {
        LiveiPadView()
    }
}
