//
//  LiveiPadView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-23.
//

import SwiftUI

struct LiveiPadView: View {
    @StateObject var live: LiveViewModel
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @State var searchText: String = ""
    
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
                        FavouritedForEachView(viewModel: live, cellView: { live in
                            LinkedVideoView(videoKey: live.id) {
                                LivePaneView(live: live)
                            }
                            .contextMenu {
                                VideoContextMenu(video: live, twitterLink: self.live.twitterList[live.channel.id] ?? nil)
                            }
                        })
                        
                        //- MARK: Not favourited
                        NotFavouritedForEachView(viewModel: live, cellView: { live in
                            LinkedVideoView(videoKey: live.id) {
                                LivePaneView(live: live)
                            }
                            .contextMenu {
                                VideoContextMenu(video: live, twitterLink: self.live.twitterList[live.channel.id] ?? nil)
                            }
                        })
                    } else {
                        SearchForEachView(viewModel: live, searchText: searchText, cellView: { live in
                            LinkedVideoView(videoKey: live.id) {
                                LivePaneView(live: live)
                            }
                            .contextMenu {
                                VideoContextMenu(video: live, twitterLink: self.live.twitterList[live.channel.id] ?? nil)
                            }
                        })
                    }
                }
                .padding(30)
                
                Divider()
                    .padding(.horizontal)
                
                Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count)")
                    .foregroundColor(.secondary)
                    .padding(.bottom, 30)
            }
        }
        .task {
            await live.getLive()
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
            LiveViewToolbar()
            Button(action: {
                Task {
                    await live.getLive()
                }
            }, label: {
                Label("Refresh", systemImage: "arrow.triangle.2.circlepath")
            })
        }
    }
}

struct LiveiPadView_Previews: PreviewProvider {
    static var previews: some View {
        LiveiPadView()
    }
}
