//
//  LiveAccessoryRectangularWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

@available(iOS 16.0, *)
struct LiveAccessoryRectangularWidgetView: View {
    @Environment(\.widgetRenderingMode) var renderingMode
    let live: LiveVideo
    
    var body: some View {
        switch renderingMode {
        case .accented:
            VStack(alignment: .leading) {
                Label("LIVE_WIDGET_TITLE", systemImage: "person.wave.2.fill")
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
            Label("LIVE_WIDGET_TITLE", systemImage: "person.wave.2.fill")
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

@available(iOS 16.0, *)
struct LiveAccessoryRectangularWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LiveAccessoryRectangularWidgetView(live: LiveVideo.previewLive)
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
