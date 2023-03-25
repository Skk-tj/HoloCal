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
        VStack {
            ForEach(Array(zip(videos, avatars)), id: \.0.id) { item in
                Divider()
                HStack() {
                    SmallWidgetAvatarView(avatarData: item.1)
                    
                    VStack(alignment: .leading) {
                        Text(item.0.title)
                            .lineLimit(2)
                        HStack {
                            Text("\(item.0.channel.getTalentName())")
                                .foregroundColor(.secondary)
                                .font(.footnote)
                            
                            switch videoType {
                            case .live:
                                Text("\(Image(systemName: "eye")) \(item.0.liveViewers ?? 0)")
                                    .foregroundColor(.secondary)
                                    .font(.caption2)
                            case .upcoming:
                                UpcomingTimeView(liveSchedule: item.0.startScheduled, fontSize: .caption2, shortMode: true)
                            case .past:
                                PastTimeView(endedAt: item.0.endedAt, fontSize: .caption2, shortMode: true)
                            }
                        }
                    }
                }
                .frame(minWidth: .infinity)
            }
        }
    }
}

struct MultipleVideoLargeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleVideoLargeWidgetView(videos: [LiveVideo.previewLive, LiveVideo.previewLive2, LiveVideo.previewLive2, LiveVideo.previewLiveMemberOnly], avatars: [Data(), Data(), Data(), Data()], videoType: .live)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
