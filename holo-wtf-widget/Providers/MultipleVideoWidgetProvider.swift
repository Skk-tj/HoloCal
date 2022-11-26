//
//  MultipleLiveWidgetProvider.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-23.
//

import WidgetKit

struct MultipleVideoWidgetProvider: IntentTimelineProvider {
    typealias Entry = MultipleVideoWidgetEntry
    
    let videoType: VideoType
    
    func placeholder(in context: Context) -> Entry {
        return MultipleVideoWidgetEntry(date: Date(), status: .ok, videoLeft: widgetSampleVideo, thumbnailDataLeft: Data(), videoRight: widgetSampleVideo, thumbnailDataRight: Data())
    }
    
    func getSnapshot(for configuration: SelectAgencyIntent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: {$0.isHololive || $0.isNijisanji}))
        }
    }
    
    func getTimeline(for configuration: SelectAgencyIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries: [MultipleVideoWidgetEntry] = [await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: {$0.isHololive || $0.isNijisanji})]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
