//
//  UpcomingView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-22.
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: UpcomingViewModel
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = false
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        NavigationView {
            if isShowingCompactInUpcomingView {
                UpcomingCompactListView(upcoming: upcoming)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        UpcomingViewToolbar(upcomingViewModel: upcoming)
                    }
            } else {
                UpcomingCardListView(upcoming: upcoming)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        UpcomingViewToolbar(upcomingViewModel: upcoming)
                    }
            }
        }
        .task {
            await upcoming.getUpcoming()
        }
        .refreshable {
            await upcoming.getUpcoming()
        }
        .navigationViewStyle(.stack)
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
