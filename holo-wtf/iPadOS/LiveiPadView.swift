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
    
    let layout = [
        GridItem(.adaptive(minimum: 250), spacing: 10)
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
                    ForEach(live.videoList.filter { video in
                        favourited.contains(where: { video.channel.id == $0 })
                    }) { live in
                        LinkedVideoView(videoKey: live.id) {
                            LivePaneView(live: live)
                        }
                        .contextMenu {
                            VideoContextMenu(video: live)
                        }
                    }
                    
                    ForEach(live.videoList.filter { video in
                        !favourited.contains(where: { video.channel.id == $0 })
                    }, id: \.self) { live in
                        LinkedVideoView(videoKey: live.id) {
                            LivePaneView(live: live)
                        }
                        .contextMenu {
                            VideoContextMenu(video: live)
                        }
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
