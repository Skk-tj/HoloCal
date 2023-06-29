//
//  SmallWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct SmallWidgetView: View {
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
                    Text("\(Image(systemName: "clock")) \(video.getUpcomingRelativeTimeString(shortMode: true))")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                case .past:
                    Text("\(Image(systemName: "clock")) \(video.getPastRelativeTimeString(shortMode: true))")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView(video: LiveVideo.previewLive, avatarData: Data(), videoType: .live)
#if os(iOS)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
#endif
    }
}
