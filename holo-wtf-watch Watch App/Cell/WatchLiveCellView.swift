//
//  WatchLiveCellView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct WatchLiveCellView: View {
    let live: LiveVideo
    
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
                
                Text("\(Image(systemName: "eye")) \(live.liveViewers)")
                    .foregroundColor(.secondary)
                    .font(.footnote)
                
                LiveTimeView(liveTime: live.startActual, fontSize: .footnote, shortMode: true)
            }
        }
    }
}

struct WatchLiveCellView_Previews: PreviewProvider {
    static var previews: some View {
        WatchLiveCellView(live: LiveVideo.previewLive)
    }
}
