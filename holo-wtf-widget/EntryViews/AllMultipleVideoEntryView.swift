//
//  AllMultipleVideoEntryView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI

struct AllMultipleVideoEntryView: View {
    var entry: MultipleVideoWidgetEntry
    var videoType: VideoType
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemMedium:
            MultipleWidgetEntryView(entry: entry, videoType: videoType)
        // case .systemLarge:
        //     MultipleVideoLargeEntryView(entry: entry, videoType: videoType)
        default:
            EmptyView()
        }
    }
}
