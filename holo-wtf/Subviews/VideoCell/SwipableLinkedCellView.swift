//
//  SwipableLinkedCellView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-10.
//

import SwiftUI

struct SwipableLinkedCellView<Content: View>: View {
    let video: any LiveVideo
    let content: () -> Content
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    init(video: any LiveVideo, @ViewBuilder content: @escaping () -> Content) {
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
            
            if #available(iOS 16.0, *) {
                ShareLink(item: URL(string: "https://www.youtube.com/watch?v=\(video.id)")!, label: { Label("VIDEO_CONTEXT_MENU_SHARE", systemImage: "square.and.arrow.up")
                })
                .tint(.blue)
            } else {
                OldShareButton(video: video) {
                    Label("LINKED_VIDEO_SWIPE_ACTIONS_SHARE", systemImage: "square.and.arrow.up")
                }
                .tint(.blue)
            }
        }
    }
}

struct SwipableLinkedCellView_Previews: PreviewProvider {
    static var previews: some View {
        SwipableLinkedCellView(video: HololiveLiveVideo.previewLive) {
            LiveCellView(live: HololiveLiveVideo.previewLive)
        }
    }
}
