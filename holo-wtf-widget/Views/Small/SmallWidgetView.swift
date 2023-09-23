//
//  SmallWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct SmallWidgetView: View {
    @Environment(\.showsWidgetContainerBackground) var showsBackground
    
    let video: LiveVideo
    let avatarData: Data
    let videoType: VideoType
    
    var body: some View {
        VStack(alignment: .leading) {
            SmallWidgetAvatarView(avatarData: avatarData, showsBackground: showsBackground)
            
            VStack(alignment: .leading) {
                Text(video.title)
                    .font(showsBackground ? .caption : .subheadline)
                    .lineLimit(2, reservesSpace: true)
                Text(video.channel.getTalentName())
                    .lineLimit(1)
                    .font(showsBackground ? .caption : .subheadline)
                    .foregroundColor(.secondary)
                
                switch videoType {
                case .live:
                    if video.isMengen {
                        Text("\(Image(systemName: "person.fill.checkmark")) \(Text("BLOCK_MEMBER_ONLY_MEMBER"))")
                            .foregroundColor(.secondary)
                            .font(.caption2)
                    } else {
                        Text("\(Image(systemName: "eye")) \(video.liveViewers ?? 0)")
                            .foregroundColor(.secondary)
                            .font(.caption2)
                    }
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
