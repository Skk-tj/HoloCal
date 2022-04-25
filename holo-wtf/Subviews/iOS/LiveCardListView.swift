//
//  LiveCardListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI
import Algorithms

struct LiveCardListView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    @State var searchText: String = ""
    
    let live: LiveViewModel
    
    var body: some View {
        List {
            if searchText.isEmpty {
                if favourited.count != 0 && live.dataStatus == .success {
                    Section {
                        ForEach(live.videoList.filter { video in
                            favourited.contains(where: { video.channel.id == $0 })
                        }) { live in
                            SwipableLinkedCellView(video: live) {
                                LivePaneView(live: live)
                            }
                            .contextMenu {
                                VideoContextMenu(video: live, twitterLink: self.live.twitterList[live.channel.id] ?? nil)
                            }
                            .listRowSeparator(.hidden)
                        }
                    }
                }
                
                Section {
                    ForEach(live.videoList.filter { video in
                        !favourited.contains(where: { video.channel.id == $0 })
                    }, id: \.self) { live in
                        SwipableLinkedCellView(video: live) {
                            LivePaneView(live: live)
                        }
                        .contextMenu {
                            VideoContextMenu(video: live, twitterLink: self.live.twitterList[live.channel.id] ?? nil)
                        }
                        .listRowSeparator(.hidden)
                    }
                    HStack {
                        Spacer()
                        DataStatusIndicatorView(dataStatus: live.dataStatus) {
                            Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count)")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .listRowSeparator(.hidden)
                }
            } else {
                Section {
                    ForEach(live.videoList.filter { video in
                        video.channel.talent.names[.en]!.localizedCaseInsensitiveContains(searchText) || video.channel.talent.names[.ja]!.localizedCaseInsensitiveContains(searchText)
                    }) { live in
                        SwipableLinkedCellView(video: live) {
                            LivePaneView(live: live)
                        }
                        .contextMenu {
                            VideoContextMenu(video: live, twitterLink: self.live.twitterList[live.channel.id] ?? nil)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "SEARCH_BY_NAME_OR_TAG")
//            if searchText.isEmpty {
//                ForEach(
//                    live.videoList
//                        .map { video in talentsToName[TalentsEnum(rawValue: video.channel.id)!]! }
//                ) { talent in
//                    Text("\(talent.names[.en]!) / \(talent.names[.ja]!)")
//                }
//            } else {
//                ForEach(
//                    live.videoList
//                        .map { video in talentsToName[TalentsEnum(rawValue: video.channel.id)!]! }
//                        .filter { talent in talent.names[.en]!.localizedCaseInsensitiveContains(searchText) || talent.names[.ja]!.localizedCaseInsensitiveContains(searchText) }
//                ) { talent in
//                    Text("\(talent.names[.en]!) / \(talent.names[.ja]!)")
//                }
//            }
        .listStyle(.plain)
    }
}

//struct LiveCardListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveCardListView()
//    }
//}
