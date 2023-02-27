//
//  LiveAccessoryRectangularWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct LiveAccessoryRectangularWidgetView: View {
    @Environment(\.widgetRenderingMode) var renderingMode
    let live: LiveVideo
    
    var body: some View {
        AccessoryRectangularWidgetView(titleView: {
            Label("LIVE_WIDGET_TITLE_NON_BOLD", systemImage: "person.wave.2.fill")
        }, video: live)
    }
}

struct LiveAccessoryRectangularWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LiveAccessoryRectangularWidgetView(live: LiveVideo.previewLive)
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
