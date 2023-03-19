//
//  SharedEntryView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct VideoWidgetEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    var videoType: VideoType
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidgetEntryView(entry: entry, videoType: videoType)
        case .systemLarge:
            PaneWidgetEntryView(entry: entry, videoType: videoType)
        case .accessoryRectangular:
            AccessoryRectangularEntryView(entry: entry, videoType: videoType)
        case .accessoryCorner:
            AccessoryCornerEntryView(entry: entry, videoType: videoType)
        case .accessoryCircular:
            AccessoryCircularEntryView(entry: entry, videoType: videoType)
        case .accessoryInline:
            AccessoryInlineEntryView(entry: entry, videoType: videoType)
        default:
            EmptyView()
        }
    }
}
