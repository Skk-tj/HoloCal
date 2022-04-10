//
//  ContentView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
//

import SwiftUI

struct LiveView: View {
    @StateObject var live: LiveViewModel
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel())
    }
    
    var body: some View {
        NavigationView {
            List {
                if favourited.count != 0 && live.dataStatus == .success {
                    Section {
                        ForEach(live.videoList.filter { video in
                            favourited.contains(where: { video.channel.id == $0 })
                        }) { live in
                            SwipableLinkedCellView(video: live) {
                                LiveCellView(live: live)
                            }
                        }
                    }
                }
                
                Section {
                    ForEach(live.videoList.filter { video in
                        !favourited.contains(where: { video.channel.id == $0 })
                    }, id: \.self) { live in
                        SwipableLinkedCellView(video: live) {
                            LiveCellView(live: live)
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
            .navigationTitle("LIVE_VIEW_TITLE")
            .toolbar {
                LiveViewToolbar()
            }
        }
        .task {
            await live.getLive()
        }
        .refreshable {
            await live.getLive()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LiveView()
            LiveView().preferredColorScheme(.dark)
        }
    }
}
