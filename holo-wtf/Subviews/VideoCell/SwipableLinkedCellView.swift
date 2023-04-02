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
    
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    var body: some View {
        LinkedVideoView(url: video.url) {
            content()
        }
        .swipeActions {
            let isFavourited = favourited.contains(where: {$0 == video.channel.id})
            FavouriteButton(video: video) {
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
            LiveCellView(live: LiveVideo.previewLive)
        }
    }
}
