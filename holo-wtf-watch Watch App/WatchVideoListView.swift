//
//  WatchVideoListView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct WatchVideoListView<VideoContent: View, DataStatusContent: View>: View {
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
                        FavouriteButton(video: video) { isFavourited in
                            Label(isFavourited ? "LINKED_VIDEO_SWIPE_ACTIONS_UNFAVOURITE" : "LINKED_VIDEO_SWIPE_ACTIONS_FAVOURITE", systemImage: isFavourited ? "star.slash" : "star")
                        }
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
