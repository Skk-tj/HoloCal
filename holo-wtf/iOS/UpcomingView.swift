//
//  UpcomingView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-22.
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: UpcomingViewModel = UpcomingViewModel(for: .hololive)
    
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    var body: some View {
        NavigationView {
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
        .navigationViewStyle(.stack)
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
