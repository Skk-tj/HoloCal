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
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = true
    
    init() {
        self._upcoming = StateObject(wrappedValue: UpcomingViewModel())
    }
    
    var body: some View {
        NavigationView {
            if isShowingCompactInUpcomingView {
                UpcomingCompactListView(upcoming: upcoming)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        UpcomingViewToolbar()
                    }
            } else {
                UpcomingCardListView(upcoming: upcoming)
                    .navigationTitle("UPCOMING_VIEW_TITLE")
                    .toolbar {
                        UpcomingViewToolbar()
                    }
            }
        }
        .task {
            await upcoming.getVideo()
        }
        .refreshable {
            await upcoming.getVideo()
        }
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
