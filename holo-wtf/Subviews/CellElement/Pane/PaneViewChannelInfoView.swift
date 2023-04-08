//
//  PaneViewChannelInfoView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PaneViewChannelInfoView: View {
    let video: LiveVideo
    
    @State var isShowingCollabSheet = false
    
    var body: some View {
        HStack {
            LiveAvatarView(url: video.channel.photo, avatarRadius: 40.0)
            
            ChannelNameView(channel: video.channel)
            if let mentions = video.mentions {
                LiveCollabAvatarView(mentions: mentions, avatarRadius: 40.0)
                    .onTapGesture {
                        isShowingCollabSheet.toggle()
                    }
                    .sheet(isPresented: $isShowingCollabSheet, content: {
                        LiveCollabListView(mentions: mentions)
                            .presentationDetents([.medium, .large])
                    })
            }
        }
    }
}

struct PaneViewChannelInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PaneViewChannelInfoView(video: LiveVideo.previewLive)
    }
}
