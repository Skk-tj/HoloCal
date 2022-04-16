//
//  LiveCardListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import SwiftUI

struct LiveCardListView: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    let live: LiveViewModel
    
    var body: some View {
        List {
            if favourited.count != 0 && live.dataStatus == .success {
                Section {
                    ForEach(live.videoList.filter { video in
                        favourited.contains(where: { video.channel.id == $0 })
                    }) { live in
                        SwipableLinkedCellView(video: live) {
                            LivePaneView(live: live)
                        }
                        .listRowSeparator(.hidden)
                        .contextMenu {
                            VideoContextMenu(video: live)
                        }
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
                    .listRowSeparator(.hidden)
                    .contextMenu {
                        VideoContextMenu(video: live)
                    }
                }
                HStack {
                    Spacer()
                    if (live.dataStatus == .fail) {
                        Label("FAILED_TO_RETRIEVE_NEW_DATA", systemImage: "exclamationmark.circle.fill")
                            .foregroundColor(.secondary)
                    } else {
                        if (live.dataStatus == .working) {
                            ProgressView()
                        } else {
                            Text("LIVE_VIEW_CURRENT_COUNT \(live.videoList.count)")
                                .foregroundColor(.secondary)
                        }
                    }
                    Spacer()
                }
            }
        }
        .listStyle(.plain)
    }
}

//struct LiveCardListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveCardListView()
//    }
//}
