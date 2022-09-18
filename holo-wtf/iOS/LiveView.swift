//
//  ContentView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveView: View {
    @StateObject var live: LiveViewModel
    
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompactInLiveView: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel())
    }
    
    var body: some View {
        NavigationView {
            if isShowingCompactInLiveView {
                LiveCompactListView(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(live as VideoViewModel)
                    .navigationTitle("LIVE_VIEW_TITLE")
                    .toolbar {
                        ToolbarItemGroup {
                            LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                                .environmentObject(live as VideoViewModel)
                        }
                    }
            } else {
                LiveCardListView(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(live as VideoViewModel)
                    .navigationTitle("LIVE_VIEW_TITLE")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                                .environmentObject(live as VideoViewModel)
                        }
                    }
            }
        }
        .task {
            await live.getLive()
            currentPresentationMode = .normal
        }
        .refreshable {
            await live.getLive()
            currentPresentationMode = .normal
        }
        .navigationViewStyle(.stack)
    }
}

struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LiveView()
            LiveView().preferredColorScheme(.dark)
        }
    }
}
