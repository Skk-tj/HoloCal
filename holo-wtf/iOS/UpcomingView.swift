//
//  UpcomingView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: UpcomingViewModel
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        NavigationView {
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
            .navigationTitle("UPCOMING_VIEW_TITLE")
            .toolbar {
                UpcomingViewToolbar()
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
