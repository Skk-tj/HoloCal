//
//  FavouriteButton.swift
//  holo-wtf
//
//
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
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        FavouriteButton(video: previewLive) {
            Label("VIDEO_CONTEXT_MENU_FAVOURITE_CHANNEL", systemImage: "star")
        }
    }
}
