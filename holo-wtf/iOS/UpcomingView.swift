//
//  UpcomingView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-22.
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: UpcomingViewModel
    let agency: AgencyEnum
    
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _upcoming = StateObject(wrappedValue: UpcomingViewModel(for: agency))
    }
    
    var body: some View {
        if isShowingCompactInUpcomingView {
            UpcomingCompactListView(currentPresentationMode: $currentPresentationMode)
                .environmentObject(upcoming as VideoViewModel)
                .navigationTitle(agency.getAgency().localizedName)
                .toolbar {
                    ToolbarItemGroup {
                        UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                            .environmentObject(upcoming as VideoViewModel)
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
        } else {
            UpcomingCardListView(currentPresentationMode: $currentPresentationMode)
                .environmentObject(upcoming as VideoViewModel)
                .navigationTitle(agency.getAgency().localizedName)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                            .environmentObject(upcoming as VideoViewModel)
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
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView(for: .hololive)
        UpcomingView(for: .nijisanji)
            .preferredColorScheme(.dark)
    }
}
