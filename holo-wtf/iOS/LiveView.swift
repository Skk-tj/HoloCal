//
//  ContentView.swift
//  holo-wtf
//
//
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
                        LiveViewToolbar(liveViewModel: live)
                    }
            } else {
                LiveCardListView(live: live)
                    .navigationTitle("LIVE_VIEW_TITLE")
                    .toolbar {
                        LiveViewToolbar(liveViewModel: live)
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
