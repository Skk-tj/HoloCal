//
//  WatchPastCellView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct WatchPastCellView: View {
    let past: LiveVideo
    
    var body: some View {
        HStack {
            LiveAvatarView(url: past.channel.photo, avatarRadius: 32)
            
            VStack(alignment: .leading) {
                Text(past.title)
                    .font(.caption)
                    .lineLimit(2)
                
                Text(past.channel.getTalentName())
                    .font(.footnote)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
                
                PastTimeView(endedAt: past.endedAt, fontSize: .caption2)
            }
        }
    }
}

struct WatchPastCellView_Previews: PreviewProvider {
    static var previews: some View {
        WatchPastCellView(past: LiveVideo.previewLive)
    }
}
