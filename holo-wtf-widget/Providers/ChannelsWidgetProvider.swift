//
//  LiveChannelsProvider.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-10-08.
//

import Foundation
import WidgetKit

struct ChannelsWidgetProvider: TimelineProvider {
    typealias Entry = ChannelsEntry
    
    let url: String
    let sortStrategy: (any LiveVideo, any LiveVideo) -> Bool
    
    func placeholder(in context: Context) -> Entry {
        return Entry(date: .now, status: .ok, channels: [widgetSampleChannel], thumbnails: [Data()])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getChannelsEntry(from: url, sortBy: sortStrategy, filterBy: {$0.isHololive}))
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries = [await getChannelsEntry(from: url, sortBy: sortStrategy, filterBy: {$0.isHololive})]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
