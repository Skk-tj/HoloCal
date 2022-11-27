//
//  LiveAccessoryCornerEntryView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct LiveAccessoryCornerEntryView: View {
    var entry: VideoWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            LiveAccessoryCornerView(live: video)
        } else {
            Image(systemName: "person.wave.2.fill")
                .widgetAccentable()
                .widgetLabel {
                    Text("NO_ONE_IS_STREAMING")
                }
        }
    }
}
