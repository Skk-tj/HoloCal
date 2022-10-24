//
//  UpcomingAccessoryCornerView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-22.
//

import SwiftUI
import WidgetKit

@available(iOSApplicationExtension 16.0, *)
struct UpcomingAccessoryCornerView: View {
    let upcoming: any LiveVideo
    
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            Image(systemName: "clock")
                .font(.title.bold())
        }
        .widgetAccentable()
        .widgetLabel {
            Text(upcoming.channel.getTalentName())
        }
    }
}

@available(iOSApplicationExtension 16.0, *)
struct UpcomingAccessoryCornerView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingAccessoryCornerView(upcoming: HololiveLiveVideo.previewLive)
    }
}
