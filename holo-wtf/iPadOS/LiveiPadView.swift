//
//  LiveiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveiPadView: View {
    @StateObject var live: LiveViewModel
    @State var isShowingAbsoluteTime: Bool = getIsShowingAbsoluteTimeInLiveViewFromUserDefaults()
    
    let layout = [
        GridItem(.adaptive(minimum: 250), spacing: 15)
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
                    ForEach(live.videoList, id: \.self) { live in
                        LinkedVideoView(videoKey: live.ytVideoKey) {
                            LivePaneView(live: live, isShowingAbsoluteTime: $isShowingAbsoluteTime)
                        }
                    }
                }
                .padding(30)
                
                Divider()
                
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
            VideoViewToolbar(userDefaultSettingsKey: "isShowingAbsoluteTimeInLiveView", isShowingAbsoluteTime: $isShowingAbsoluteTime)
        }
    }
}

struct LiveiPadView_Previews: PreviewProvider {
    static var previews: some View {
        LiveiPadView()
    }
}
