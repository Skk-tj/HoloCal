//
//  LiveAccessoryCornerView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

@available(iOSApplicationExtension 16.0, *)
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

@available(iOSApplicationExtension 16.0, *)
struct LiveAccessoryCornerView_Previews: PreviewProvider {
    static var previews: some View {
        LiveAccessoryCornerView(live: LiveVideo.previewLive)
    }
}
