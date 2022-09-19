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
                    .font(.caption)
                    .widgetAccentable()
                
                Text(live.title)
                    .font(.caption)
                
                Text(live.channel.getTalentName())
                    .lineLimit(1)
                    .font(.footnote)
                
                Text("\(Image(systemName: "eye")) \(live.liveViewers)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        default:
            widget
        }
    }
    
    var widget: some View {
        VStack(alignment: .leading) {
            Label("LIVE_WIDGET_TITLE", systemImage: "person.wave.2.fill")
                .font(.caption)
            
            Text(live.title)
                .font(.caption)
            
            Text(live.channel.getTalentName())
                .lineLimit(1)
                .font(.footnote)
            
            Text("\(Image(systemName: "eye")) \(live.liveViewers)")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}

@available(iOS 16.0, *)
struct LiveAccessoryRectangularWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LiveAccessoryRectangularWidgetView(live: LiveVideo.previewLive)
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
