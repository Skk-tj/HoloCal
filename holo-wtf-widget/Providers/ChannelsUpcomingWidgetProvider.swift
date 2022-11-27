//
//  ChannelsUpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-11-27.
//

import WidgetKit

struct ChannelsUpcomingWidgetProvider: IntentTimelineProvider {
    typealias Entry = ChannelsEntry
    typealias Intent = UpcomingWidgetIntent
    
    func placeholder(in context: Context) -> Entry {
        return Entry(date: .now, status: .ok, channels: [widgetSampleChannel], thumbnails: [Data()])
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getChannelsEntry(for: configuration.agency, videoType: .upcoming, sortBy: IntentSortBy.mostRecent, filterBy: {$0.isHololive || $0.isNijisanji}))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries = [await getChannelsEntry(for: configuration.agency, videoType: .upcoming, sortBy: IntentSortBy.mostRecent, filterBy: {$0.isHololive || $0.isNijisanji})]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
