//
//  UpcomingView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: UpcomingViewModel
    let agency: AgencyEnum
    
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompact: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _upcoming = StateObject(wrappedValue: UpcomingViewModel(for: agency))
    }
    
    var body: some View {
        VideoUIListView(currentPresentationMode: $currentPresentationMode, videoType: .upcoming, uiMode: isShowingCompact ? .compact : .card)
            .environmentObject(upcoming as VideoViewModel)
            .navigationTitle(agency.getAgency().localizedName)
            .toolbar {
                ToolbarItemGroup {
                    UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                        .environmentObject(upcoming as VideoViewModel)
                }
            }
            .task {
                await upcoming.getVideoForUI()
                currentPresentationMode = .normal
            }
            .refreshable {
                await upcoming.getVideoForUI()
                currentPresentationMode = .normal
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
