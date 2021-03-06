//
//  FavouriteButton.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-22.
//

import SwiftUI

struct FavouriteButton<Content: View>: View {
    let video: LiveVideo
    @ViewBuilder let content: () -> Content
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        let isFavourited = favourited.contains(where: {$0 == video.channel.id})
        Button(action: {
            withAnimation {
                if !isFavourited {
                    favourited.append(video.channel.id)
                } else {
                    favourited.removeAll(where: {$0 == video.channel.id})
                }
            }
        }) {
            content()
        }
    }
}

struct FavouriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteButton(video: LiveVideo.previewLive) {
            Label("VIDEO_CONTEXT_MENU_FAVOURITE_CHANNEL", systemImage: "star")
        }
    }
}
