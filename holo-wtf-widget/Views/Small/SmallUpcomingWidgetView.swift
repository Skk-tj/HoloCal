//
//  SmallUpcomingWidgetView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct SmallUpcomingWidgetView: View {
    let upcoming: LiveVideo
    let avatarData: Data
    
    var body: some View {
        VStack(alignment: .leading) {
            SmallWidgetAvatarView(avatarData: avatarData)
            
            Text(upcoming.title)
                .font(.caption)
                .lineLimit(2, reservesSpace: true)
                .fixedSize(horizontal: false, vertical: true)
            Text(upcoming.channel.getTalentName())
                .lineLimit(1)
                .font(.caption)
                .foregroundColor(.secondary)
            
            UpcomingTimeView(liveSchedule: upcoming.startScheduled, fontSize: .caption2)
        }
    }
}

struct SmallUpcomingWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallUpcomingWidgetView(upcoming: LiveVideo.previewLive, avatarData: Data())
        #if os(iOS)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        #endif
    }
}
