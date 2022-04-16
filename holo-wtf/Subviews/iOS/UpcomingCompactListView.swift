//
//  UpcomingCompactListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct UpcomingCompactListView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    let upcoming: UpcomingViewModel
    
    var body: some View {
        List {
            if favourited.count != 0 && upcoming.dataStatus == .success {
                Section {
                    ForEach(upcoming.videoList.filter { video in
                        favourited.contains(where: { video.channel.id == $0 })
                    }) { live in
                        SwipableLinkedCellView(video: live) {
                            UpcomingCellView(upcoming: live)
                        }
                    }
                }
            }
            
            Section {
                ForEach(upcoming.videoList.filter { video in
                    !favourited.contains(where: { video.channel.id == $0 })
                }, id: \.self) { live in
                    SwipableLinkedCellView(video: live) {
                        UpcomingCellView(upcoming: live)
                    }
                }
                HStack {
                    Spacer()
                    if (upcoming.dataStatus == .fail) {
                        Label("FAILED_TO_RETRIEVE_NEW_DATA", systemImage: "exclamationmark.circle.fill")
                            .foregroundColor(.secondary)
                    } else {
                        if (upcoming.dataStatus == .working) {
                            ProgressView()
                        } else {
                            Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(upcoming.videoList.count) \(getUpcomingStreamLookAheadHoursFromUserDefaults())")
                                .foregroundColor(.secondary)
                        }
                    }
                    Spacer()
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
