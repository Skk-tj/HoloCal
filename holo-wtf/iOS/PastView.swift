//
//  PastView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastView: View {
    @StateObject var past: PastViewModel
    let agency: AgencyEnum
    
    @AppStorage(UserDefaultKeys.isShowingCompactInPastView) var isShowingCompact: Bool = false
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _past = StateObject(wrappedValue: PastViewModel(for: agency))
    }
    
    var body: some View {
        VideoUIListView(currentPresentationMode: $currentPresentationMode, videoType: .past, uiMode: isShowingCompact ? .compact : .card)
            .environmentObject(past as VideoViewModel)
            .navigationTitle(agency.getAgency().localizedName)
            .toolbar {
                ToolbarItemGroup(placement: .secondaryAction) {
                    PastViewToolbar(currentPresentationMode: $currentPresentationMode)
                        .environmentObject(past as VideoViewModel)
                }
            }
            .task {
                await past.getVideoForUI()
                currentPresentationMode = .normal
                self.past.sortingStrategy = .notSorting
            }
            .refreshable {
                await past.getVideoForUI()
                currentPresentationMode = .normal
                self.past.sortingStrategy = .notSorting
            }
            .animation(.easeInOut, value: past.dataStatus)
    }
}

struct PastView_Previews: PreviewProvider {
    static var previews: some View {
        PastView(for: .hololive)
    }
}
