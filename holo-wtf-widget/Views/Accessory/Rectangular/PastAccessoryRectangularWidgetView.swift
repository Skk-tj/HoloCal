//
//  PastAccessoryRectangularWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct PastAccessoryRectangularWidgetView: View {
    @Environment(\.widgetRenderingMode) var renderingMode
    let past: LiveVideo
    
    var body: some View {
        AccessoryRectangularWidgetView(titleView: {
            Label("PAST_WIDGET_TITLE_NON_BOLD", systemImage: "clock.arrow.circlepath")
        }, video: past)
    }
}

struct PastAccessoryRectangularWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        PastAccessoryRectangularWidgetView(past: .previewLive)
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
