//
//  FavouriteButton.swift
//  holo-wtf
//
//
//

import SwiftUI

struct FavouriteButton<Content: View>: View {
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    let video: LiveVideo
    @ViewBuilder let content: (_ isFavourited: Bool) -> Content
    
    var body: some View {
        let isFavourited = favourited.contains(where: {$0 == video.channel.id})
        Button(action: {
            if !isFavourited {
                favourited.append(video.channel.id)
            } else {
                favourited.removeAll(where: {$0 == video.channel.id})
            }
        }, label: {
            content(isFavourited)
        })
        .onChange(of: favourited, perform: { favourited in
            NSUbiquitousKeyValueStore.default.set(favourited, forKey: UserDefaultKeys.favouritedChannel)
        })
    }
}

struct FavouriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteButton(video: LiveVideo.previewLive) { _ in
            Label("VIDEO_CONTEXT_MENU_FAVOURITE_CHANNEL", systemImage: "star")
        }
    }
}
