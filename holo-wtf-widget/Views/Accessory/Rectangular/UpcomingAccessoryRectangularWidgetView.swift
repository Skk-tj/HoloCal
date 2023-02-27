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
        AccessoryRectangularWidgetView(titleView: {
            Label("UPCOMING_WIDGET_TITLE_NON_BOLD", systemImage: "clock")
        }, video: upcoming)
    }
}

struct UpcomingAccessoryRectangularWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingAccessoryRectangularWidgetView(upcoming: LiveVideo.previewLive)
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
