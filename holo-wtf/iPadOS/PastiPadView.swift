//
//  PastiPadView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastiPadView: View {
    @StateObject var past: PastViewModel
    let agency: AgencyEnum
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _past = StateObject(wrappedValue: PastViewModel(for: agency))
    }
    
    var body: some View {
        iPadLazyGridView(singleVideoView: { live in
            LinkedVideoView(url: live.url) {
                PastPaneView(past: live)
            }
            .contextMenu {
                VideoContextMenu(video: live)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: past.dataStatus) {
                VideoCountView(videoType: .past)
            }
        }, isFavourite: false)
        .environmentObject(past as VideoViewModel)
        .task {
            past.sortingStrategy = .endedFirst
            await past.getVideoForUI()
            currentPresentationMode = .normal
        }
        .refreshable {
            past.sortingStrategy = .endedFirst
            await past.getVideoForUI()
            currentPresentationMode = .normal
        }
        .navigationTitle(agency.getAgency().localizedName)
        .toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                PastViewToolbar(currentPresentationMode: $currentPresentationMode)
                    .environmentObject(past as VideoViewModel)
            }
        }
        .animation(.easeInOut, value: past.dataStatus)
    }
}

struct PastiPadView_Previews: PreviewProvider {
    static var previews: some View {
        PastiPadView(for: .hololive)
    }
}
