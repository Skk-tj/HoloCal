//
//  WatchVideoListView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct WatchVideoListView<VideoContent: View, DataStatusContent: View>: View {
    @AppStorage(UserDefaultKeys.favouritedChannel) var favourited = Favourited()
    
    @EnvironmentObject var viewModel: VideoViewModel
    
    /// The view of a single video.
    @ViewBuilder let singleVideoView: (_ live: LiveVideo) -> VideoContent
    
    /// The view of the counter at the bottom.
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        List {
            ForEach(viewModel.videoList, id: \.self) { video in
                singleVideoView(video)
                    .swipeActions {
                        let isFavourited = favourited.contains(where: {$0 == video.channel.id})
                        FavouriteButton(video: video, content: {
                            Label(isFavourited ? "LINKED_VIDEO_SWIPE_ACTIONS_UNFAVOURITE" : "LINKED_VIDEO_SWIPE_ACTIONS_FAVOURITE", systemImage: isFavourited ? "star.slash" : "star")
                        }, userDefaultSuite: nil)
                        .tint(.yellow)
                    }
            }
            
            HStack {
                Spacer()
                dataStatusView()
                Spacer()
            }
        }
    }
}
