//
//  UpcomingCompactListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct UpcomingCompactListView: View {
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
                                UpcomingCellView(upcoming: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
                            }
                        }
                    }
                }
                
                Section {
                    ForEach(upcoming.videoList.filter { video in
                        !favourited.contains(where: { video.channel.id == $0 })
                    }, id: \.self) { live in
                        SwipableLinkedCellView(video: live) {
                            UpcomingCellView(upcoming: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
                        }
                    }
                    HStack {
                        Spacer()
                        DataStatusIndicatorView(dataStatus: upcoming.dataStatus) {
                            Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(upcoming.videoList.count) \(getUpcomingStreamLookAheadHoursFromUserDefaults())")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                }
            } else {
                Section {
                    ForEach(upcoming.videoList.filter { video in
                        video.channel.talent.names[.en]!.localizedCaseInsensitiveContains(searchText) || video.channel.talent.names[.ja]!.localizedCaseInsensitiveContains(searchText)
                    }) { live in
                        SwipableLinkedCellView(video: live) {
                            UpcomingCellView(upcoming: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "SEARCH_BY_NAME_OR_TAG")
    }
}

//struct UpcomingCompactListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingCompactListView()
//    }
//}
