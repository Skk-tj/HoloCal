//
//  ContentView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
//

import SwiftUI

struct LiveView: View {
    @StateObject var live: LiveViewModel
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompactInLiveView: Bool = false
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel())
    }
    
    var body: some View {
        NavigationView {
            if isShowingCompactInLiveView {
                LiveCompactListView(live: live)
                    .navigationTitle("LIVE_VIEW_TITLE")
                    .toolbar {
                        LiveViewToolbar()
                    }
            } else {
                LiveCardListView(live: live)
                    .navigationTitle("LIVE_VIEW_TITLE")
                    .toolbar {
                        LiveViewToolbar()
                    }
            }
        }
        .task {
            await live.getLive()
        }
        .refreshable {
            await live.getLive()
        }
        .navigationViewStyle(.stack)
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
