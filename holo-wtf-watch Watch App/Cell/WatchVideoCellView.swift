//
//  WatchVideoCellView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct WatchVideoCellView: View {
    let video: LiveVideo
    let videoType: VideoType
    
    var body: some View {
        HStack {
            LiveAvatarView(url: video.channel.photo, avatarRadius: 32)
            
            VStack(alignment: .leading) {
                Text(video.title)
                    .font(.caption)
                    .lineLimit(2)
                
                Text(video.channel.getTalentName())
                    .font(.footnote)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
                
                HStack {
                    switch videoType {
                    case .live:
                        Text("\(Image(systemName: "eye")) \(video.liveViewers ?? 0)")
                        Spacer()
                        LiveTimeView(liveTime: video.startActual, fontSize: .footnote, shortMode: true)
                    case .upcoming:
                        UpcomingTimeView(liveSchedule: video.startScheduled, fontSize: .caption2, shortMode: true)
                    case .past:
                        PastTimeView(endedAt: video.endedAt, fontSize: .caption2)
                    }
                }
                .foregroundColor(.secondary)
                .font(.footnote)
            }
        }
    }
}

struct WatchVideoCellView_Previews: PreviewProvider {
    static var previews: some View {
        WatchVideoCellView(video: .previewLive, videoType: .live)
    }
}
