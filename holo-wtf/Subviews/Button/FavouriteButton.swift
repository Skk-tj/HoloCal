//
//  FavouriteButton.swift
//  holo-wtf
//
//
//

import SwiftUI

struct FavouriteButton<Content: View>: View {
    let video: LiveVideo
    let content: () -> Content
    
    @AppStorage var favourited: Favourited
    
    init(video: LiveVideo, content: @escaping () -> Content, userDefaultSuite: String? = "group.io.skk-tj.holo-wtf.ios") {
        self.video = video
        self.content = content
        
        if let userDefaultSuite {
            self._favourited = AppStorage(wrappedValue: Favourited(), UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: userDefaultSuite))
        } else {
            self._favourited = AppStorage(wrappedValue: Favourited(), UserDefaultKeys.favouritedChannel)
        }
    }
    
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
        .onChange(of: favourited) { favourited in
            let keyStore = NSUbiquitousKeyValueStore()
            keyStore.set(favourited, forKey: UserDefaultKeys.favouritedChannel)
            keyStore.synchronize()
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
