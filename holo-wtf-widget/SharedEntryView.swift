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

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentVideoWidgetEntryView: View {
    var entry: AppIntentVideoLiveWidgetProvider.Entry
    var videoType: VideoType
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            AppIntentSmallWidgetEntryView(entry: entry, videoType: videoType)
        case .systemLarge:
            AppIntentPaneWidgetEntryView(entry: entry, videoType: videoType)
        case .accessoryRectangular:
            AppIntentAccessoryRectangularEntryView(entry: entry, videoType: videoType)
        case .accessoryCorner:
            AppIntentAccessoryCornerEntryView(entry: entry, videoType: videoType)
        case .accessoryCircular:
            AppIntentAccessoryCircularEntryView(entry: entry, videoType: videoType)
        case .accessoryInline:
            AppIntentAccessoryInlineEntryView(entry: entry, videoType: videoType)
        default:
            EmptyView()
        }
    }
}
