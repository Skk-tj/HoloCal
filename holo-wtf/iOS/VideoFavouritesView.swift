//
//  VideoFavouritesView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoFavouritesView: View {
    @StateObject var video: VideoFavoritesViewModel
    let videoType: VideoType
    
    @AppStorage var isShowingCompact: Bool
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    init(videoType: VideoType) {
        self.videoType = videoType
        _video = StateObject(wrappedValue: VideoFavoritesViewModel(videoType: videoType))
        
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
        VideoUIListView(currentPresentationMode: Binding.constant(.normal), videoType: videoType, uiMode: isShowingCompact ? .compact : .card, isFavourite: false)
            .environmentObject(video as VideoViewModel)
            .navigationTitle("ROOT_VIEW_FAVOURITES")
            .toolbar {
                ToolbarItemGroup(placement: .secondaryAction) {
                    VideoFavouritesViewToolbar(videoType: videoType)
                        .environmentObject(video as VideoViewModel)
                }
            }
            .task {
                await video.getVideoForUI()
                self.video.sortingStrategy = .notSorting
            }
            .refreshable {
                await video.getVideoForUI()
                self.video.sortingStrategy = .notSorting
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
}
