//
//  ContentView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
//

import SwiftUI

struct LiveView: View {
    @StateObject var live: LiveViewModel
    let agency: AgencyEnum
    
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompactInLiveView: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _live = StateObject(wrappedValue: LiveViewModel(for: agency))
    }
    
    var body: some View {
            if isShowingCompactInLiveView {
                LiveCompactListView(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(live as VideoViewModel)
                    .navigationTitle(agency.getAgency().localizedName)
                    .toolbar {
                        ToolbarItemGroup {
                            LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                                .environmentObject(live as VideoViewModel)
                        }
                    }
                    .task {
                        await live.getLive()
                        currentPresentationMode = .normal
                    }
                    .refreshable {
                        await live.getLive()
                        currentPresentationMode = .normal
                    }
            } else {
                LiveCardListView(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(live as VideoViewModel)
                    .navigationTitle(agency.getAgency().localizedName)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                                .environmentObject(live as VideoViewModel)
                        }
                    }
                    .task {
                        await live.getLive()
                        currentPresentationMode = .normal
                    }
                    .refreshable {
                        await live.getLive()
                        currentPresentationMode = .normal
                    }
            }
    }
}

struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LiveView(for: .hololive)
            LiveView(for: .nijisanji).preferredColorScheme(.dark)
        }
    }
}
