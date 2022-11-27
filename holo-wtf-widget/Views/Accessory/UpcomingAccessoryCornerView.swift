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
        Image(systemName: "clock")
            .font(.title.bold())
            .widgetAccentable()
            .widgetLabel {
                Text(upcoming.channel.getTalentName())
            }
    }
}

struct UpcomingAccessoryCornerView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingAccessoryCornerView(upcoming: LiveVideo.previewLive)
            .previewContext(WidgetPreviewContext(family: .accessoryCorner))
    }
}
