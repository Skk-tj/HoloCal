//
//  UpcomingView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: UpcomingViewModel
    
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        NavigationView {
            if isShowingCompactInUpcomingView {
                UpcomingCompactListView(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(upcoming as HololiveVideoViewModel)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        ToolbarItemGroup {
                            UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                                .environmentObject(upcoming as HololiveVideoViewModel)
                        }
                    }
            } else {
                UpcomingCardListView(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(upcoming as HololiveVideoViewModel)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                                .environmentObject(upcoming as HololiveVideoViewModel)
                        }
                    }
            }
        }
        .task {
            await upcoming.getUpcoming()
            currentPresentationMode = .normal
        }
        .refreshable {
            await upcoming.getUpcoming()
            currentPresentationMode = .normal
        }
        .navigationViewStyle(.stack)
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
