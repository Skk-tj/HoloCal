//
//  LiveStackView.swift
//  holo-wtf
//
//
//

import SwiftUI

@available(iOS 16.0, *)
struct LiveStackView: View {
    @StateObject var live: LiveViewModel
    
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompactInLiveView: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init() {
        self._live = StateObject(wrappedValue: LiveViewModel())
    }
    
    var body: some View {
        NavigationStack {
            if isShowingCompactInLiveView {
                LiveCompactListView(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(live as HololiveVideoViewModel)
                    .navigationTitle("LIVE_VIEW_TITLE")
                    .toolbar {
                        ToolbarItemGroup {
                            LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                                .environmentObject(live as HololiveVideoViewModel)
                        }
                    }
            } else {
                LiveCardListView(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(live as HololiveVideoViewModel)
                    .navigationTitle("LIVE_VIEW_TITLE")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                                .environmentObject(live as HololiveVideoViewModel)
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
    }
}

@available(iOS 16.0, *)
struct LiveStackView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LiveStackView()
            LiveStackView().preferredColorScheme(.dark)
        }
    }
}
