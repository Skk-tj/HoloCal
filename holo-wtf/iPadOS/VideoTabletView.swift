//
//  VideoTabletView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoTabletView: View {
    @StateObject var video: VideoViewModel
    let agency: AgencyEnum
    let videoType: VideoType
    
    @State var currentPresentationMode: PresentationMode = .normal
    
    init(for agency: AgencyEnum, videoType: VideoType) {
        self.agency = agency
        self.videoType = videoType
        _video = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: videoType))
    }
    
    var body: some View {
        LazyGridView(singleVideoView: { video in
            LinkedVideoView(url: video.url) {
                switch videoType {
                case .live:
                    LivePaneView(live: video)
                case .upcoming:
                    UpcomingPaneView(upcoming: video)
                case .past:
                    PastPaneView(past: video)
                }
            }
            .contextMenu {
                VideoContextMenu(video: video)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: video.dataStatus) {
                VideoCountView(videoType: videoType)
            }
        }, isFavourite: false)
        .environmentObject(video)
        .task {
            switch videoType {
            case .live:
                video.sortingStrategy = .timeDesc
            case .upcoming:
                video.sortingStrategy = .timeAsc
            case .past:
                video.sortingStrategy = .endedFirst
            }
            
            await video.getVideoForUI()
            currentPresentationMode = .normal
        }
        .refreshable {
            switch videoType {
            case .live:
                video.sortingStrategy = .timeDesc
            case .upcoming:
                video.sortingStrategy = .timeAsc
            case .past:
                video.sortingStrategy = .endedFirst
            }
            
            await video.getVideoForUI()
            currentPresentationMode = .normal
        }
        .navigationTitle(agency.getAgency().localizedName)
        .toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                switch videoType {
                case .live:
                    LiveViewToolbar(currentPresentationMode: $currentPresentationMode)
                        .environmentObject(video)
                case .upcoming:
                    UpcomingViewToolbar(currentPresentationMode: $currentPresentationMode)
                        .environmentObject(video)
                case .past:
                    PastViewToolbar(currentPresentationMode: $currentPresentationMode)
                        .environmentObject(video)
                }
                
            }
        }
        .animation(.easeInOut, value: video.dataStatus)
    }
}
