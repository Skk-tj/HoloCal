//
//  VideoWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct VideoWatchView: View {
    @StateObject var video: VideoViewModel
    let agency: AgencyEnum
    let videoType: VideoType
    
    init(for agency: AgencyEnum, videoType: VideoType) {
        self.agency = agency
        self.videoType = videoType
        _video = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: videoType))
    }
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            WatchVideoCellView(video: video, videoType: videoType)
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: video.dataStatus) {
                VideoCountView(videoType: videoType)
                    .font(.footnote)
                    .environmentObject(video)
            }
        })
        .navigationTitle(agency.getAgency().localizedName)
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
        }
    }
}
