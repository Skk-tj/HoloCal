//
//  LiveStackView.swift
//  holo-wtf
//
//
//

import SwiftUI

@available(iOS 16.0, *)
struct LiveStackView: View {
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

@available(iOS 16.0, *)
struct LiveStackView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LiveStackView(for: .hololive)
            LiveStackView(for: .nijisanji).preferredColorScheme(.dark)
        }
    }
}
