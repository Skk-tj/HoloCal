//
//  LiveAccessoryCornerEntryView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

@available(iOSApplicationExtension 16.0, *)
struct LiveAccessoryCornerEntryView: View {
    var entry: VideoWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            LiveAccessoryCornerView(live: video)
        } else {
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "person.wave.2.fill")
                    .font(.title.bold())
            }
            .widgetAccentable()
            .widgetLabel {
                Text("NO_ONE_IS_STREAMING")
            }
        }
    }
}
