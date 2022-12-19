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
            
            if let mentions = video.mentions {
                ChannelNameView(channel: video.channel)
                
                LiveCollabAvatarView(mentions: mentions, avatarRadius: 40.0)
                    .onTapGesture {
                        isShowingCollabSheet.toggle()
                    }
                    .sheet(isPresented: $isShowingCollabSheet, content: {
                        LiveCollabListStackView(mentions: mentions)
                            .presentationDetents([.medium, .large])
                    })
            } else {
                ChannelNameView(channel: video.channel)
            }
        }
    }
}

struct ChannelNameView: View {
    let channel: Channel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(channel.getTalentName())
                .lineLimit(1)
                .font(.subheadline)
                .fontWeight(.bold)
            Text(channel.getAltTalentName())
                .lineLimit(1)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct PaneViewChannelInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PaneViewChannelInfoView(video: LiveVideo.previewLive)
    }
}
