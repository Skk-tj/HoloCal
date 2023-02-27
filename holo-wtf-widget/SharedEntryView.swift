//
//  SharedEntryView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct VideoLiveWidgetEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidgetEntryView(entry: entry, videoType: .live)
        case .systemLarge:
            PaneWidgetEntryView(entry: entry, videoType: .live)
        case .accessoryRectangular:
            AccessoryRectangularEntryView(entry: entry, videoType: .live)
        case .accessoryCorner:
            AccessoryCornerEntryView(entry: entry, videoType: .live)
        case .accessoryCircular:
            AccessoryCircularEntryView(entry: entry)
        default:
            EmptyView()
        }
    }
}

struct VideoUpcomingWidgetEntryView: View {
    var entry: VideoUpcomingWidgetProvider.Entry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidgetEntryView(entry: entry, videoType: .upcoming)
        case .systemLarge:
            PaneWidgetEntryView(entry: entry, videoType: .upcoming)
        case .accessoryRectangular:
            AccessoryRectangularEntryView(entry: entry, videoType: .upcoming)
        case .accessoryCorner:
            AccessoryCornerEntryView(entry: entry, videoType: .upcoming)
        case .accessoryCircular:
            AccessoryCircularEntryView(entry: entry)
        default:
            EmptyView()
        }
    }
}

struct VideoPastWidgetEntryView: View {
    var entry: VideoPastWidgetProvider.Entry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidgetEntryView(entry: entry, videoType: .past)
        case .systemLarge:
            PaneWidgetEntryView(entry: entry, videoType: .past)
        case .accessoryRectangular:
            AccessoryRectangularEntryView(entry: entry, videoType: .past)
        case .accessoryCorner:
            AccessoryCornerEntryView(entry: entry, videoType: .past)
        case .accessoryCircular:
            AccessoryCircularEntryView(entry: entry)
        default:
            EmptyView()
        }
    }
}
