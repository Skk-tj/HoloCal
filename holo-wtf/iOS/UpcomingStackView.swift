//
//  UpcomingStackView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-12.
//

import SwiftUI

@available(iOS 16.0, *)
struct UpcomingStackView: View {
    @StateObject var upcoming: UpcomingViewModel = UpcomingViewModel(for: .hololive)
    
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    var body: some View {
        NavigationStack {
            if isShowingCompactInUpcomingView {
                UpcomingCompactListView(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(upcoming as VideoViewModel)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        ToolbarItemGroup {
                            UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                                .environmentObject(upcoming as VideoViewModel)
                        }
                    }
            } else {
                UpcomingCardListView(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(upcoming as VideoViewModel)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                                .environmentObject(upcoming as VideoViewModel)
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
    }
}

@available(iOS 16.0, *)
struct UpcomingStackView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingStackView()
    }
}
