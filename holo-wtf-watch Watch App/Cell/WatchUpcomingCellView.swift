//
//  WatchUpcomingCellView.swift
//  holo-wtf-watch Watch App
//
//  Created by Haoyi An on 2022-09-18.
//

import SwiftUI

struct WatchUpcomingCellView: View {
    let upcoming: any LiveVideo
    
    var body: some View {
        HStack {
            LiveAvatarView(url: upcoming.channel.photo, avatarRadius: 32)
            
            VStack(alignment: .leading) {
                Text(upcoming.title)
                    .font(.caption)
                    .lineLimit(2)
                
                Text(upcoming.channel.getTalentName())
                    .font(.footnote)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
                
                UpcomingTimeView(liveSchedule: upcoming.startScheduled, fontSize: .caption2)
            }
        }
    }
}

struct WatchUpcomingCellView_Previews: PreviewProvider {
    static var previews: some View {
        WatchUpcomingCellView(upcoming: HololiveLiveVideo.previewLive)
    }
}
