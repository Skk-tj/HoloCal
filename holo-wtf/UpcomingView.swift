//
//  UpcomingView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-22.
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
                    if (!upcoming.isSuccess) {
                        Label("Failed to Retrive New Data", systemImage: "exclamationmark.circle.fill")
                            .foregroundColor(.secondary)
                    } else {
                        Text("\(upcoming.videoList.count) Upcoming Streams")
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
            }.navigationTitle("Upcoming Streams")
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
