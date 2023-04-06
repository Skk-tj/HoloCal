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
                    .font(.headline)
                    .lineLimit(2)
                
                Text(video.channel.getTalentName())
                    .font(.caption)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
                
                HStack {
                    switch videoType {
                    case .live:
                        Text("\(Image(systemName: "eye")) \(video.liveViewers ?? 0)")
                            .font(.footnote)
                        Spacer()
                        LiveTimeView(liveTime: video.startActual, fontSize: .footnote, shortMode: true)
                    case .upcoming:
                        UpcomingTimeView(liveSchedule: video.startScheduled, fontSize: .footnote)
                    case .past:
                        PastTimeView(endedAt: video.endedAt, fontSize: .footnote)
                    }
                }
                .foregroundColor(.secondary)
            }
        }
    }
}

struct WatchVideoCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            WatchVideoCellView(video: .previewLive, videoType: .live)
            WatchVideoCellView(video: .previewLive, videoType: .upcoming)
            WatchVideoCellView(video: .previewLive, videoType: .past)
        }
    }
}
