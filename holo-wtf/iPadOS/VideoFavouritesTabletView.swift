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
    
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    init(videoType: VideoType) {
        _video = StateObject(wrappedValue: VideoFavoritesViewModel(videoType: videoType))
        self.videoType = videoType
    }
    
    var body: some View {
        LazyGridView(singleVideoView: { video in
            LinkedVideoView(url: video.url) {
                VideoPaneView(video: video, videoType: videoType)
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
                VideoFavouritesViewToolbar(videoType: videoType)
                    .environmentObject(video as VideoViewModel)
            }
        }
        .animation(.easeInOut, value: video.dataStatus)
        .onReceive(NotificationCenter.default.publisher(for: NSUbiquitousKeyValueStore.didChangeExternallyNotification), perform: { @MainActor _ in
            if let favourited = NSUbiquitousKeyValueStore.default.array(forKey: UserDefaultKeys.favouritedChannel) {
                self.favourited = favourited as? [String] ?? []
                Task {
                    await video.getVideoForUI()
                }
            }
        })
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
