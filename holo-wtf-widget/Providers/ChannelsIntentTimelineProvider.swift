//
//  ChannelsIntentTimelineProvider.swift
//  holo-wtf
//
//
//

import Foundation
import WidgetKit

protocol ChannelsIntentTimelineProvider: IntentTimelineProvider where Entry == ChannelsEntry, Intent: AgencyIntent {
    var videoType: VideoType { get }
    var sortBy: IntentSortBy { get }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
protocol ChannelsAppIntentTimelineProvider: AppIntentTimelineProvider where Entry == AppIntentChannelsEntry, Intent: AgencyAppIntent {
    var videoType: VideoType { get }
    var sortBy: IntentSortByAppEnum { get }
}

extension ChannelsIntentTimelineProvider {
    func placeholder(in context: Context) -> Entry {
        return Entry(date: .now, status: .ok, channels: [widgetSampleChannel], thumbnails: [Data()], agency: .unknown)
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries = [await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
extension ChannelsAppIntentTimelineProvider {
    func placeholder(in context: TimelineProviderContext) -> Entry {
        return Entry(date: .now, status: .ok, channels: [widgetSampleChannel], thumbnails: [Data()], agency: .hololive)
    }
    
    func snapshot(for configuration: Intent, in context: TimelineProviderContext) async -> Entry {
        return await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency })
    }
                                      
    func timeline(for configuration: Intent, in context: TimelineProviderContext) async -> Timeline<Entry> {
        let entries = [await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency })]
        return Timeline(entries: entries, policy: .atEnd)
    }
}
