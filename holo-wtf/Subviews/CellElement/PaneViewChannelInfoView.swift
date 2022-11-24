//
//  PaneViewChannelInfoView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-23.
//

import SwiftUI

struct PaneViewChannelInfoView: View {
    let video: LiveVideo
    
    @State var isShowingCollabSheet = false
    
    var body: some View {
        HStack {
            LiveAvatarView(url: video.channel.photo, avatarRadius: 40.0)
            
            if let mentions = video.mentions {
                VStack(alignment: .leading) {
                    Text(video.channel.getTalentName())
                        .lineLimit(1)
                        .font(.subheadline)
                    Text(video.channel.getAltTalentName())
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                LiveCollabAvatarView(mentions: mentions, avatarRadius: 40.0)
                    .onTapGesture {
                        isShowingCollabSheet.toggle()
                    }
                    .sheet(isPresented: $isShowingCollabSheet, content: {
                        if #available(iOS 16.0, *) {
                            LiveCollabListStackView(mentions: mentions)
                                .presentationDetents([.medium, .large])
                        } else {
                            LiveCollabListView(mentions: mentions)
                        }
                    })
            } else {
                VStack(alignment: .leading) {
                    Text(video.channel.getTalentName())
                        .lineLimit(1)
                        .font(.subheadline)
                    Text(video.channel.getAltTalentName())
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct PaneViewChannelInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PaneViewChannelInfoView(video: LiveVideo.previewLive)
    }
}
