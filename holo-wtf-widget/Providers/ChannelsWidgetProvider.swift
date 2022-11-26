//
//  ChannelsProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import Foundation
import WidgetKit

struct ChannelsWidgetProvider: IntentTimelineProvider {
    typealias Entry = ChannelsEntry
    
    let videoType: VideoType
    
    func placeholder(in context: Context) -> Entry {
        return Entry(date: .now, status: .ok, channels: [widgetSampleChannel], thumbnails: [Data()])
    }
    
    func getSnapshot(for configuration: SelectAgencyIntent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: {$0.isHololive || $0.isNijisanji}))
        }
    }
    
    func getTimeline(for configuration: SelectAgencyIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries = [await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: {$0.isHololive || $0.isNijisanji})]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
