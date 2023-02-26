//
//  ChannelsProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct ChannelsLiveWidgetProvider: ChannelIntentTimelineProvider {
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
