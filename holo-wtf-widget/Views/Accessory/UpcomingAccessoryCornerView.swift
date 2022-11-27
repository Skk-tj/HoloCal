//
//  UpcomingAccessoryCornerView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-22.
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

@available(watchOS 9.0, *)
struct UpcomingAccessoryCornerView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingAccessoryCornerView(upcoming: LiveVideo.previewLive)
    }
}
