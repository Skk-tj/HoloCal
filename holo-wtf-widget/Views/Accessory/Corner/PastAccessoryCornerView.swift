//
//  PastAccessoryCornerView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct PastAccessoryCornerView: View {
    let past: LiveVideo
    
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            Image(systemName: "clock.arrow.circlepath")
        }
        .font(.title.bold())
        .widgetAccentable()
        .widgetLabel(past.channel.getTalentName())
    }
}

struct PastAccessoryCornerView_Previews: PreviewProvider {
    static var previews: some View {
        PastAccessoryCornerView(past: .previewLive)
#if os(watchOS)
            .previewContext(WidgetPreviewContext(family: .accessoryCorner))
#endif
    }
}
