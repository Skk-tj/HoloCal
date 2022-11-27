//
//  MultipleLiveWidgetProvider.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-23.
//

import WidgetKit

struct MultipleVideoLiveWidgetProvider: IntentTimelineProvider {
    typealias Entry = MultipleVideoWidgetEntry
    typealias Intent = LiveWidgetIntent
    
    func placeholder(in context: Context) -> Entry {
        return MultipleVideoWidgetEntry(date: Date(), status: .ok, videoLeft: widgetSampleVideo, thumbnailDataLeft: Data(), videoRight: widgetSampleVideo, thumbnailDataRight: Data())
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getMultipleEntry(for: configuration.agency, videoType: .live, sortBy: configuration.sortBy, filterBy: {$0.isHololive || $0.isNijisanji}))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries: [MultipleVideoWidgetEntry] = [await getMultipleEntry(for: configuration.agency, videoType: .live, sortBy: configuration.sortBy, filterBy: {$0.isHololive || $0.isNijisanji})]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
