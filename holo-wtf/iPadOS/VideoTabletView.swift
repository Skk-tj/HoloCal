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
            VideoPaneView(video: video, videoType: videoType)
                .contextMenu {
                    VideoContextMenu(video: video)
                }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: video.dataStatus, error: video.error) {
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
                VideoViewToolbar(currentPresentationMode: $currentPresentationMode, videoType: videoType)
                    .environmentObject(video)
            }
        }
        .animation(.easeInOut, value: video.dataStatus)
    }
}
