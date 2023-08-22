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
