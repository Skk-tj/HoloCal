//
//  LiveAccessoryCornerView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-22.
//

import SwiftUI
import WidgetKit

struct LiveAccessoryCornerView: View {
    let live: LiveVideo
    
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            Image(systemName: "person.wave.2.fill")
                .font(.title.bold())
        }
        .widgetAccentable()
        .widgetLabel {
            Text(live.channel.getTalentName())
        }
    }
}

struct LiveAccessoryCornerView_Previews: PreviewProvider {
    static var previews: some View {
        LiveAccessoryCornerView(live: LiveVideo.previewLive)
    }
}
