//
//  UpcomingAccessoryCornerEntryView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-22.
//

import SwiftUI
import WidgetKit

@available(iOSApplicationExtension 16.0, *)
struct UpcomingAccessoryCornerEntryView: View {
    var entry: LiveWidgetProvider.Entry
    
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
