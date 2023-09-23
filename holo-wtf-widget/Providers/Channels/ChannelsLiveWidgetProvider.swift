//
//  ChannelsProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct ChannelsLiveWidgetProvider: ChannelsIntentTimelineProvider {
    typealias Entry = ChannelsEntry
    typealias Intent = LiveWidgetIntent
    
    let videoType: VideoType = .live
    let sortBy: IntentSortBy = .unknown
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries = [await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentChannelsLiveWidgetProvider: ChannelsAppIntentTimelineProvider {
    typealias Entry = AppIntentChannelsEntry
    typealias Intent = LiveWidget
    
    let videoType: VideoType = .live
    let sortBy: IntentSortByAppEnum = .mostRecent
    
    func snapshot(for configuration: Intent, in context: Context) async -> Entry {
        return await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency })
    }
    
    func timeline(for configuration: Intent, in context: Context) async -> Timeline<Entry> {
        let entries = [await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency })]
        return Timeline(entries: entries, policy: .atEnd)
    }
}
