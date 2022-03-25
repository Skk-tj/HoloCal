//
//  UpcomingView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-22.
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: UpcomingViewModel
    
    @State var isShowingAbsoluteTime = getIsShowingAbsoluteTimeInUpcomingViewFromUserDefaults()
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(upcoming.videoList, id: \.self) { live in
                    LinkedVideoView(videoKey: live.ytVideoKey) {
                        UpcomingCellView(upcoming: live, isShowingAbsoluteTime: $isShowingAbsoluteTime)
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
            .navigationTitle("UPCOMING_VIEW_TITLE")
            .toolbar {
                VideoViewToolbar(userDefaultSettingsKey: "isShowingAbsoluteTimeInUpcomingView", isShowingAbsoluteTime: $isShowingAbsoluteTime)
            }
        }
        .task {
            await upcoming.getUpcoming()
        }
        .refreshable {
            await upcoming.getUpcoming()
        }
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
