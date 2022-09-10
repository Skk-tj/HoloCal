//
//  SmallUpcomingWidgetView.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-09-01.
//

import SwiftUI
import WidgetKit

struct SmallUpcomingWidgetView: View {
    let upcoming: LiveVideo
    let avatarData: Data
    
    var body: some View {
        VStack(alignment: .leading) {
            if let avatarImage = UIImage(data: avatarData) {
                Image(uiImage: avatarImage)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                    .shadow(radius: 1)
            }
            
            Text(upcoming.escapedTitle)
                .font(.caption)
                .lineLimit(2)
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
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
