//
//  UpcomingCompactListView.swift
//  holo-wtf
//
//
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
                        video.channel.talent.names[.en]!.localizedCaseInsensitiveContains(searchText) || video.channel.talent.names[.ja]!.localizedCaseInsensitiveContains(searchText) || (video.topicId ?? "") .localizedStandardContains(searchText)
                    }) { live in
                        SwipableLinkedCellView(video: live) {
                            UpcomingCellView(upcoming: live, twitterLink: upcoming.twitterList[live.channel.id] ?? nil)
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "SEARCH_BY_NAME_OR_TAG") {
            if searchText.isEmpty {
                ForEach(upcoming.getSearchSuggestions(), id: \.self) { suggestion in
                    Text("\(suggestion)").searchCompletion(suggestion)
                }
            }
        }
    }
}

//struct UpcomingCompactListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingCompactListView()
//    }
//}
