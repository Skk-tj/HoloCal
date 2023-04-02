//
//  VideoFavouritesTabletView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoFavouritesTabletView: View {
    @StateObject var video: VideoFavoritesViewModel
    let videoType: VideoType
    
    init(videoType: VideoType) {
        _video = StateObject(wrappedValue: VideoFavoritesViewModel(videoType: videoType))
        self.videoType = videoType
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
                VideoFavouriteCountView(videoType: videoType)
            }
        }, isFavourite: true)
        .environmentObject(video as VideoViewModel)
        .task {
            await video.getVideoForUI()
        }
        .refreshable {
            await video.getVideoForUI()
        }
        .navigationTitle(getNavigationTitle())
        .toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                switch videoType {
                case .live:
                    LiveFavouritesViewToolbar()
                        .environmentObject(video as VideoViewModel)
                case .upcoming:
                    UpcomingFavouritesViewToolbar()
                        .environmentObject(video as VideoViewModel)
                case .past:
                    PastFavouritesViewToolbar()
                        .environmentObject(video as VideoViewModel)
                }
            }
        }
        .animation(.easeInOut, value: video.dataStatus)
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
