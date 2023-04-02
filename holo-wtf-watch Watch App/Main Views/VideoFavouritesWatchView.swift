//
//  VideoFavouritesWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct VideoFavouritesWatchView: View {
    @StateObject var video: VideoFavoritesViewModel
    let videoType: VideoType
    
    init(videoType: VideoType) {
        self.videoType = videoType
        _video = StateObject(wrappedValue: VideoFavoritesViewModel(videoType: videoType))
    }
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            switch videoType {
            case .live:
                WatchLiveCellView(live: video)
            case .upcoming:
                WatchUpcomingCellView(upcoming: video)
            case .past:
                WatchPastCellView(past: video)
            }
            
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: video.dataStatus) {
                VideoFavouriteCountView(videoType: videoType)
                    .font(.footnote)
                    .environmentObject(video as VideoViewModel)
            }
        })
        .navigationTitle(getNavigationTitle())
        .environmentObject(video as VideoViewModel)
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
    
    func getNavigationTitle() -> LocalizedStringKey {
        switch videoType {
        case .live:
            return "LIVE_VIEW_TITLE"
        case .upcoming:
            return "UPCOMING_VIEW_TITLE"
        case .past:
            return "PAST_VIEW_TITLE"
        }
    }
}
