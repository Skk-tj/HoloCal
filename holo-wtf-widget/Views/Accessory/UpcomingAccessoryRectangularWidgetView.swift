//
//  UpcomingAccessoryRectangularWidgetView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct UpcomingAccessoryRectangularWidgetView: View {
    @Environment(\.widgetRenderingMode) var renderingMode
    let upcoming: LiveVideo
    
    var body: some View {
        switch renderingMode {
        case .accented:
            VStack(alignment: .leading) {
                Label("UPCOMING_WIDGET_TITLE_NON_BOLD", systemImage: "clock")
                    .font(.headline)
                    .widgetAccentable()
                    .lineLimit(1)
                
                Text(upcoming.title)
                    .lineLimit(1)
                
                Text(upcoming.channel.getTalentName())
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        default:
            widget
        }
    }
    
    var widget: some View {
        VStack(alignment: .leading) {
            Label("UPCOMING_WIDGET_TITLE_NON_BOLD", systemImage: "clock")
                .font(.headline)
                .lineLimit(1)
            
            Text(upcoming.title)
                .lineLimit(1)
            
            Text(upcoming.channel.getTalentName())
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct UpcomingAccessoryRectangularWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingAccessoryRectangularWidgetView(upcoming: LiveVideo.previewLive)
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
