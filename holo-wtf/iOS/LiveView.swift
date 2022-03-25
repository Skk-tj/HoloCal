//
//  ContentView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveView: View {
    @StateObject var live: LiveViewModel
    
    @State var isShowingAbsoluteTime: Bool = getIsShowingAbsoluteTimeInLiveViewFromUserDefaults()
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel())
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(live.videoList, id: \.self) { live in
                    LinkedVideoView(videoKey: live.ytVideoKey) {
                        LiveCellView(live: live, isShowingAbsoluteTime: $isShowingAbsoluteTime)
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
            .navigationTitle("LIVE_VIEW_TITLE")
            .toolbar {
                VideoViewToolbar(userDefaultSettingsKey: "isShowingAbsoluteTimeInLiveView", isShowingAbsoluteTime: $isShowingAbsoluteTime)
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
