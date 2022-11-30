//
//  UpcomingAccessoryCornerView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct UpcomingAccessoryCornerView: View {
    let upcoming: LiveVideo
    
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            Image(systemName: "clock")
        }
        .font(.title.bold())
        .widgetAccentable()
        .widgetLabel(upcoming.channel.getTalentName())
    }
}

@available(watchOS 9.0, *)
struct UpcomingAccessoryCornerView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingAccessoryCornerView(upcoming: LiveVideo.previewLive)
    }
}
