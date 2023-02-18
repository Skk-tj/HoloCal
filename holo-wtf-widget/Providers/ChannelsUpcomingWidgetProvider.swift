//
//  ChannelsUpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
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
            completion(await getChannelsEntry(for: configuration.agency, videoType: .upcoming, sortBy: IntentSortBy.mostRecent, filterBy: { $0.isSupportedAgency }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries = [await getChannelsEntry(for: configuration.agency, videoType: .upcoming, sortBy: IntentSortBy.mostRecent, filterBy: { $0.isSupportedAgency })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
