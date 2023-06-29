//
//  SwiftUIView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct TestVideoWidgetView: View {
    let video: LiveVideo
    let avatarData: Data
    let videoType: VideoType
    
    var body: some View {
        VStack(alignment: .leading) {
            SmallWidgetAvatarView(avatarData: avatarData)
            
            VStack(alignment: .leading) {
                Text(video.title)
                    .font(.caption)
                    .lineLimit(2, reservesSpace: true)
                Text(video.channel.getTalentName())
                    .lineLimit(1)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                switch videoType {
                case .live:
                    Text("\(Image(systemName: "eye")) \(video.liveViewers ?? 0)")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                case .upcoming:
                    UpcomingTimeView(liveSchedule: video.startScheduled, fontSize: .caption2)
                case .past:
                    PastTimeView(endedAt: video.endedAt)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TestVideoWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        TestVideoWidgetView(video: LiveVideo.previewLive, avatarData: Data(), videoType: .live)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
