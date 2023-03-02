//
//  AccessoryCornerView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryCornerView: View {
    let video: LiveVideo
    let videoType: VideoType
    
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            switch videoType {
            case .live:
                Image(systemName: "person.wave.2.fill")
            case .upcoming:
                Image(systemName: "clock")
            case .past:
                Image(systemName: "clock.arrow.circlepath")
            }
            
        }
        .font(.title.bold())
        .widgetAccentable()
        .widgetLabel(video.channel.getTalentName())
    }
}

struct AccessoryCornerView_Previews: PreviewProvider {
    static var previews: some View {
        AccessoryCornerView(video: .previewLive, videoType: .live)
#if os(watchOS)
            .previewContext(WidgetPreviewContext(family: .accessoryCorner))
#endif
    }
}
