//
//  AccessoryWatchCircularEntryViews.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryWatchCircularEntryViews: View {
    let entry: CountLiveWidgetProvider.Entry
    let videoType: VideoType
    
    var body: some View {
        switch entry.status {
        case .ok:
            AccessoryWatchCircularView(count: entry.count, videoType: videoType)
        default:
            ZStack {
                AccessoryWidgetBackground()
                Text("N/A")
                    .font(.title)
                    .widgetAccentable()
            }
        }
    }
}
