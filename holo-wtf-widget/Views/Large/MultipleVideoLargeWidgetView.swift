//
//  MultipleViewLargeWidgetView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct MultipleVideoLargeWidgetView: View {
    let videos: [LiveVideo]
    let avatars: [Data]
    let videoType: VideoType
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(zip(videos, avatars)), id: \.0.id) { item in
                Divider()
                HStack {
                    SmallWidgetAvatarView(avatarData: item.1)
                    VStack(alignment: .leading) {
                        Text(item.0.title)
                            .font(.footnote)
                            .lineLimit(2)
                        HStack {
                            Text("\(item.0.channel.getTalentName())")
                                .foregroundColor(.secondary)
                                .font(.footnote)

                            switch videoType {
                            case .live:
                                if item.0.isMengen {
                                    Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                } else {
                                    Text("\(Image(systemName: "eye")) \(item.0.liveViewers ?? 0)")
                                        .foregroundColor(.secondary)
                                        .font(.footnote)
                                }
                            case .upcoming:
                                Text("\(Image(systemName: "clock")) \(item.0.getUpcomingRelativeTimeString(shortMode: true))")
                                    .foregroundColor(.secondary)
                                    .font(.footnote)
                            case .past:
                                Text("\(Image(systemName: "clock")) \(item.0.getPastRelativeTimeString(shortMode: true))")
                                    .foregroundColor(.secondary)
                                    .font(.footnote)
                            }
                        }
                    }
                }
            }
            Divider()
        }
    }
}

struct MultipleVideoLargeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleVideoLargeWidgetView(videos: [LiveVideo.previewLive, LiveVideo.previewLive2, LiveVideo.previewLiveMemberOnly], avatars: [Data(), Data(), Data()], videoType: .past)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
