//
//  UpcomingiPadView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-23.
//

import SwiftUI

struct UpcomingiPadView: View {
    @StateObject var upcoming: UpcomingViewModel
    
    @State var isShowingAbsoluteTime = getIsShowingAbsoluteTimeInUpcomingViewFromUserDefaults()
    
    let layout = [
        GridItem(.adaptive(minimum: 250), spacing: 10)
    ]
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        ScrollView() {
            if (upcoming.dataStatus == .working) {
                ProgressView()
            } else if (upcoming.dataStatus == .fail) {
                Spacer()
                Label("FAILED_TO_RETRIEVE_NEW_DATA", systemImage: "exclamationmark.circle.fill")
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                LazyVGrid(columns: layout, spacing: 50) {
                    ForEach(upcoming.videoList, id: \.self) { live in
                        LinkedVideoView(videoKey: live.ytVideoKey) {
                            UpcomingPaneView(upcoming: live, isShowingAbsoluteTime: $isShowingAbsoluteTime)
                        }
                        .contextMenu {
                            VideoContextMenu(twitterLink: live.channel.twitterLink, ytChannelId: live.channel.ytChannelId)
                        }
                    }
                }
                .padding(30)
                
                Divider()
                    .padding(.horizontal)
                
                Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(upcoming.videoList.count) \(getUpcomingStreamLookAheadHoursFromUserDefaults())")
                    .foregroundColor(.secondary)
                    .padding(.bottom, 30)
            }
        }
        .task {
            await upcoming.getUpcoming()
        }
        .toolbar {
            VideoViewToolbar(userDefaultSettingsKey: "isShowingAbsoluteTimeInUpcomingView", isShowingAbsoluteTime: $isShowingAbsoluteTime)
        }
        .navigationTitle("UPCOMING_VIEW_TITLE")
    }
}

struct UpcomingiPadView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingiPadView()
    }
}
