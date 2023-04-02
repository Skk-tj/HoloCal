//
//  VideoView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoView: View {
    @StateObject var video: VideoViewModel
    let agency: AgencyEnum
    let videoType: VideoType
    
    @AppStorage var isShowingCompact: Bool
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum, videoType: VideoType) {
        self.agency = agency
        self.videoType = videoType
        
        _video = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: videoType))
        
        switch videoType {
        case .live:
            _isShowingCompact = AppStorage(wrappedValue: false, UserDefaultKeys.isShowingCompactInLiveView)
        case .upcoming:
            _isShowingCompact = AppStorage(wrappedValue: false, UserDefaultKeys.isShowingCompactInUpcomingView)
        case .past:
            _isShowingCompact = AppStorage(wrappedValue: false, UserDefaultKeys.isShowingCompactInPastView)
        }
    }
    
    var body: some View {
        VideoUIListView(currentPresentationMode: $currentPresentationMode, videoType: videoType, uiMode: isShowingCompact ? .compact : .card, isFavourite: false)
            .environmentObject(video)
            .navigationTitle(agency.getAgency().localizedName)
            .toolbar {
                ToolbarItemGroup(placement: .secondaryAction) {
                    VideoViewToolbar(currentPresentationMode: $currentPresentationMode, videoType: videoType)
                        .environmentObject(video)
                }
            }
            .task {
                await video.getVideoForUI()
                currentPresentationMode = .normal
                self.video.sortingStrategy = .notSorting
            }
            .refreshable {
                await video.getVideoForUI()
                currentPresentationMode = .normal
                self.video.sortingStrategy = .notSorting
            }
            .animation(.easeInOut, value: video.dataStatus)
    }
}
