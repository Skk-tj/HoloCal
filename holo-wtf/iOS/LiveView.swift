//
//  ContentView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
//

import SwiftUI

struct LiveView: View {
    @StateObject var live: LiveViewModel
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel())
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(live.videoList, id: \.self) { live in
                    if let key = live.ytVideoKey {
                        let url = "https://www.youtube.com/watch?v=\(key)"
                        
                        if let finalURL = URL(string: url) {
                            Link(destination: finalURL) {
                                LiveCellView(live: live)
                            }
                        } else {
                            LiveCellView(live: live)
                        }
                    } else {
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
            .navigationTitle("LIVE_VIEW_TITLE")
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
