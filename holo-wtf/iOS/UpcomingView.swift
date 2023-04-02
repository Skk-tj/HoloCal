//
//  UpcomingView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingView: View {
    @StateObject var upcoming: VideoViewModel
    let agency: AgencyEnum
    
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompact: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _upcoming = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: .upcoming))
    }
    
    var body: some View {
        VideoUIListView(currentPresentationMode: $currentPresentationMode, videoType: .upcoming, uiMode: isShowingCompact ? .compact : .card, isFavourite: false)
            .environmentObject(upcoming)
            .navigationTitle(agency.getAgency().localizedName)
            .toolbar {
                ToolbarItemGroup(placement: .secondaryAction) {
                    UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                        .environmentObject(upcoming)
                }
            }
            .task {
                await upcoming.getVideoForUI()
                currentPresentationMode = .normal
                self.upcoming.sortingStrategy = .notSorting
            }
            .refreshable {
                await upcoming.getVideoForUI()
                currentPresentationMode = .normal
                self.upcoming.sortingStrategy = .notSorting
            }
            .animation(.easeInOut, value: upcoming.dataStatus)
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView(for: .hololive)
        UpcomingView(for: .nijisanji)
            .preferredColorScheme(.dark)
    }
}
