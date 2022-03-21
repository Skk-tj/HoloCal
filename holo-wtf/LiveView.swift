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
                    if (!live.isSuccess) {
                        Label("Failed to Retrive New Data", systemImage: "exclamationmark.circle.fill")
                            .foregroundColor(.secondary)
                    } else {
                        Text("\(live.videoList.count) Currently Live on YouTube")
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
            }
            .navigationTitle("Currently Live")
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
