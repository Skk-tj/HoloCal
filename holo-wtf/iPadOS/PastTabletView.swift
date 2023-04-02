//
//  PastTabletView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastTabletView: View {
    @StateObject var past: VideoViewModel
    let agency: AgencyEnum
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum) {
        self.agency = agency
        _past = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: .past))
    }
    
    var body: some View {
        LazyGridView(singleVideoView: { live in
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
        .environmentObject(past)
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
                    .environmentObject(past)
            }
        }
        .animation(.easeInOut, value: past.dataStatus)
    }
}

struct PastTabletView_Previews: PreviewProvider {
    static var previews: some View {
        PastTabletView(for: .hololive)
    }
}
