//
//  SwipableLinkedCellView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-10.
//

import SwiftUI
import ActivityView

struct SwipableLinkedCellView<Content: View>: View {
    let video: LiveVideo
    let content: () -> Content
    @State var item: ActivityItem?
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    init(video: LiveVideo, @ViewBuilder content: @escaping () -> Content) {
        self.video = video
        self.content = content
    }
    
    var body: some View {
        LinkedVideoView(url: video.url) {
            content()
        }
        .swipeActions {
            FavouriteButton(video: video) {
                let isFavourited = favourited.contains(where: {$0 == video.channel.id})
                Label(isFavourited ? "LINKED_VIDEO_SWIPE_ACTIONS_UNFAVOURITE" : "LINKED_VIDEO_SWIPE_ACTIONS_FAVOURITE", systemImage: isFavourited ? "star.slash" : "star")
            }
            .tint(.yellow)
            
            OldShareButton(video: video) {
                Label("LINKED_VIDEO_SWIPE_ACTIONS_SHARE", systemImage: "square.and.arrow.up")
            }
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
