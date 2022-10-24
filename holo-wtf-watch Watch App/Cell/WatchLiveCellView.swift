//
//  WatchLiveCellView.swift
//  holo-wtf-watch Watch App
//
//  Created by Haoyi An on 2022-09-18.
//

import SwiftUI

struct WatchLiveCellView: View {
    let live: any LiveVideo
    
    var body: some View {
        HStack {
            LiveAvatarView(url: live.channel.photo, avatarRadius: 32)
            
            VStack(alignment: .leading) {
                Text(live.title)
                    .font(.caption)
                    .lineLimit(2)
                
                Text(live.channel.getTalentName())
                    .font(.footnote)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
                
                HStack {
                    Text("\(Image(systemName: "eye")) \(live.liveViewers)")
                    
                    Spacer()
                    
                    LiveTimeView(liveTime: live.startActual, fontSize: .footnote, shortMode: true)
                }
                .foregroundColor(.secondary)
                .font(.footnote)
            }
        }
    }
}

struct WatchLiveCellView_Previews: PreviewProvider {
    static var previews: some View {
        WatchLiveCellView(live: HololiveLiveVideo.previewLive)
    }
}
