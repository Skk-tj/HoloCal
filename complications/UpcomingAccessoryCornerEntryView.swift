//
//  UpcomingAccessoryCornerEntryView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct UpcomingAccessoryCornerEntryView: View {
    var entry: VideoWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            UpcomingAccessoryCornerView(upcoming: video)
        } else {
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "clock")
                    .font(.title.bold())
            }
            .widgetAccentable()
            .widgetLabel {
                Text("NO_ONE_IS_STREAMING")
            }
        }
    }
}
