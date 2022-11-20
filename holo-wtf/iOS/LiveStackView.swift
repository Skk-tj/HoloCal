//
//  LiveStackView.swift
//  holo-wtf
//
//
//

import SwiftUI

@available(iOS 16.0, *)
struct LiveStackView: View {
    @StateObject var live: LiveViewModel = LiveViewModel(for: .hololive)
    
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompactInLiveView: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    var body: some View {
        NavigationStack {
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
