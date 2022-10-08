//
//  LiveAccessoryRectangularWidgetView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-12.
//

import SwiftUI
import WidgetKit

@available(iOSApplicationExtension 16.0, *)
struct LiveAccessoryRectangularWidgetView: View {
    @Environment(\.widgetRenderingMode) var renderingMode
    let live: LiveVideo
    
    var body: some View {
        switch renderingMode {
        case .accented:
            VStack(alignment: .leading) {
                Label("LIVE_WIDGET_TITLE_NON_BOLD", systemImage: "person.wave.2.fill")
                    .font(.headline)
                    .widgetAccentable()
                
                Text(live.title)
                    .lineLimit(1)
                
                Text(live.channel.getTalentName())
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
            Label("LIVE_WIDGET_TITLE_NON_BOLD", systemImage: "person.wave.2.fill")
                .font(.headline)
            
            Text(live.title)
                .lineLimit(1)
            
            Text(live.channel.getTalentName())
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

@available(iOSApplicationExtension 16.0, *)
struct LiveAccessoryRectangularWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LiveAccessoryRectangularWidgetView(live: LiveVideo.previewLive)
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
