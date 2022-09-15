//
//  LiveAccessoryRectangularWidgetView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-12.
//

import SwiftUI
import WidgetKit

struct LiveAccessoryRectangularWidgetView: View {
    let live: LiveVideo
    
    var body: some View {
        VStack(alignment: .leading) {
            Label("LIVE_WIDGET_TITLE", systemImage: "person.wave.2.fill")
                .font(.caption)
            
            Text(live.title)
            
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
