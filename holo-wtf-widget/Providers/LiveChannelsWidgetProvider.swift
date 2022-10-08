//
//  LiveChannelsProvider.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-10-08.
//

import Foundation
import WidgetKit

struct LiveChannelsWidgetProvider: TimelineProvider {
    typealias Entry = ChannelsEntry
    
    func placeholder(in context: Context) -> ChannelsEntry {
        return Entry(date: .now, status: .ok, channels: [widgetSampleChannel], thumbnails: [Data()])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ChannelsEntry) -> Void) {
        Task {
            completion(await getChannelsEntry(from: hololiveLiveURL, sortBy: liveSortStrategy, filterBy: {$0.isHololive}))
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ChannelsEntry>) -> Void) {
        Task {
            let entries = [await getChannelsEntry(from: hololiveLiveURL, sortBy: liveSortStrategy, filterBy: {$0.isHololive})]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
