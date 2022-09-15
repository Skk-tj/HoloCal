//
//  UpcomingAccessoryRectangularWidgetView.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-09-12.
//

import SwiftUI
import WidgetKit

struct UpcomingAccessoryRectangularWidgetView: View {
    let upcoming: LiveVideo
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "clock")
                    .font(.caption)
                
                Text("UPCOMING_WIDGET_TITLE")
                    .font(.caption)
            }
            
            Text(upcoming.title)
                .font(.caption)
            
            Text(upcoming.channel.getTalentName())
                .font(.footnote)
            
            UpcomingTimeView(liveSchedule: upcoming.startScheduled, fontSize: .footnote)
        }
    }
}

@available(iOSApplicationExtension 16.0, *)
struct UpcomingAccessoryRectangularWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingAccessoryRectangularWidgetView(upcoming: LiveVideo.previewLive)
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}