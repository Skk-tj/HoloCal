//
//  UpcomingAccessoryRectangularWidgetView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

@available(iOSApplicationExtension 16.0, *)
struct UpcomingAccessoryRectangularWidgetView: View {
    @Environment(\.widgetRenderingMode) var renderingMode
    let upcoming: any LiveVideo
    
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

@available(iOSApplicationExtension 16.0, *)
struct UpcomingAccessoryRectangularWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingAccessoryRectangularWidgetView(upcoming: HololiveLiveVideo.previewLive)
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
