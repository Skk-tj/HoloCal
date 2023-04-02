//
//  SwipableLinkedCellView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SwipableLinkedCellView<Content: View>: View {
    let video: LiveVideo
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        LinkedVideoView(url: video.url) {
            content()
        }
        .swipeActions {
            FavouriteButton(video: video) { isFavourited in
                Label(isFavourited ? "LINKED_VIDEO_SWIPE_ACTIONS_UNFAVOURITE" : "LINKED_VIDEO_SWIPE_ACTIONS_FAVOURITE", systemImage: isFavourited ? "star.slash" : "star")
            }
            .tint(.yellow)
            
            ShareLink(item: URL(string: "https://www.youtube.com/watch?v=\(video.id)")!, label: {
                Label("VIDEO_CONTEXT_MENU_SHARE", systemImage: "square.and.arrow.up")
            })
            .tint(.blue)
        }
    }
}

struct SwipableLinkedCellView_Previews: PreviewProvider {
    static var previews: some View {
        SwipableLinkedCellView(video: LiveVideo.previewLive) {
            VideoCellView(video: LiveVideo.previewLive, videoType: .live)
        }
    }
}
