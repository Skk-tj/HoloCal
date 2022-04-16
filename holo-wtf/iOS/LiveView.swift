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
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompactInLiveView: Bool = true
    
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
            await live.getVideo()
        }
        .refreshable {
            await live.getVideo()
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
