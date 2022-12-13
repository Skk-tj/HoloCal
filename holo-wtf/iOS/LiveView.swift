//
//  ContentView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveView: View {
    @StateObject var live: LiveViewModel
    let agency: AgencyEnum
    
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompact: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _live = StateObject(wrappedValue: LiveViewModel(for: agency))
    }
    
    var body: some View {
        VideoUIListView(currentPresentationMode: $currentPresentationMode, videoType: .live, uiMode: isShowingCompact ? .compact : .card)
            .environmentObject(live as VideoViewModel)
            .navigationTitle(agency.getAgency().localizedName)
            .toolbar {
                ToolbarItemGroup(placement: .secondaryAction) {
                    LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                        .environmentObject(live as VideoViewModel)
                }
            }
            .task {
                await live.getVideoForUI()
                currentPresentationMode = .normal
            }
            .refreshable {
                await live.getVideoForUI()
                currentPresentationMode = .normal
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
