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
            LivePaneWidgetEntryView(entry: entry)
        case .accessoryRectangular:
            LiveAccessoryRectangularWidgetEntryView(entry: entry)
        case .accessoryCorner:
            LiveAccessoryCornerEntryView(entry: entry)
        case .accessoryCircular:
            LiveAccessoryCircularWidgetEntryView(entry: entry)
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
            UpcomingPaneWidgetEntryView(entry: entry)
        case .accessoryRectangular:
            UpcomingAccessoryRectangularWidgetEntryView(entry: entry)
        case .accessoryCorner:
            UpcomingAccessoryCornerEntryView(entry: entry)
        case .accessoryCircular:
            UpcomingAccessoryCircularWidgetEntryView(entry: entry)
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
            PastPaneWidgetEntryView(entry: entry)
        case .accessoryRectangular:
            PastAccessoryRectangularWidgetEntryView(entry: entry)
        case .accessoryCorner:
            PastAccessoryCornerEntryView(entry: entry)
        case .accessoryCircular:
            PastAccessoryCircularWidgetEntryView(entry: entry)
        default:
            EmptyView()
        }
    }
}
