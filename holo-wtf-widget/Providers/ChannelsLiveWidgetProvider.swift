//
//  ChannelsProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct ChannelsLiveWidgetProvider: IntentTimelineProvider {
    typealias Entry = ChannelsEntry
    typealias Intent = LiveWidgetIntent
    
    func placeholder(in context: Context) -> Entry {
        return Entry(date: .now, status: .ok, channels: [widgetSampleChannel], thumbnails: [Data()])
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getChannelsEntry(for: configuration.agency, videoType: .live, sortBy: configuration.sortBy, filterBy: {$0.isHololive || $0.isNijisanji}))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries = [await getChannelsEntry(for: configuration.agency, videoType: .live, sortBy: configuration.sortBy, filterBy: {$0.isHololive || $0.isNijisanji})]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
