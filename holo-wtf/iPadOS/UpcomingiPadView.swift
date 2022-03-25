//
//  UpcomingiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingiPadView: View {
    @StateObject var upcoming: UpcomingViewModel
    
    let layout = [
        GridItem(.adaptive(minimum: 250), spacing: 20)
    ]
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        ScrollView {
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
                        if let key = live.ytVideoKey {
                            let url = "https://www.youtube.com/watch?v=\(key)"
                            
                            if let finalURL = URL(string: url) {
                                Link(destination: finalURL) {
                                    UpcomingPaneView(upcoming: live)
                                }
                            } else {
                                UpcomingPaneView(upcoming: live)
                            }
                        } else {
                            UpcomingPaneView(upcoming: live)
                        }
                    }
                }
                .padding(30)
                
                Divider()
                
                Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(upcoming.videoList.count) \(getUpcomingStreamLookAheadHoursFromUserDefaults())")
                    .foregroundColor(.secondary)
                    .padding(.bottom, 30)
            }
        }
        .task {
            await upcoming.getUpcoming()
        }
        .navigationTitle("UPCOMING_VIEW_TITLE")
    }
}

struct UpcomingiPadView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingiPadView()
    }
}
