//
//  ContentView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveView: View {
    @StateObject var live: VideoViewModel
    let agency: AgencyEnum
    
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompact: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _live = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: .live))
    }
    
    var body: some View {
        VideoUIListView(currentPresentationMode: $currentPresentationMode, videoType: .live, uiMode: isShowingCompact ? .compact : .card, isFavourite: false)
            .environmentObject(live)
            .navigationTitle(agency.getAgency().localizedName)
            .toolbar {
                ToolbarItemGroup(placement: .secondaryAction) {
                    LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                        .environmentObject(live)
                }
            }
            .task {
                await live.getVideoForUI()
                currentPresentationMode = .normal
                self.live.sortingStrategy = .notSorting
            }
            .refreshable {
                await live.getVideoForUI()
                currentPresentationMode = .normal
                self.live.sortingStrategy = .notSorting
            }
            .animation(.easeInOut, value: live.dataStatus)
    }
}

struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        LiveView(for: .hololive)
        LiveView(for: .nijisanji)
            .preferredColorScheme(.dark)
    }
}
