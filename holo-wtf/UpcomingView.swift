//
//  UpcomingView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: UpcomingViewModel
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(upcoming.videoList, id: \.self) { live in
                    if let key = live.ytVideoKey {
                        let url = "https://www.youtube.com/watch?v=\(key)"
                        
                        if let finalURL = URL(string: url) {
                            Link(destination: finalURL) {
                                UpcomingCellView(upcoming: live)
                            }
                        } else {
                            UpcomingCellView(upcoming: live)
                        }
                    } else {
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
            }.navigationTitle("UPCOMING_VIEW_TITLE")
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
