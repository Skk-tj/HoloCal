//
//  MultipleVideoUpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct MultipleVideoUpcomingWidgetProvider: IntentTimelineProvider {
    typealias Entry = MultipleVideoWidgetEntry
    typealias Intent = UpcomingWidgetIntent
    
    func placeholder(in context: Context) -> Entry {
        return MultipleVideoWidgetEntry(date: Date(), status: .ok, videoLeft: widgetSampleVideo, thumbnailDataLeft: Data(), videoRight: widgetSampleVideo, thumbnailDataRight: Data())
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getMultipleEntry(for: configuration.agency, videoType: .upcoming, sortBy: IntentSortBy.mostRecent, filterBy: { $0.isSupportedAgency }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries: [MultipleVideoWidgetEntry] = [await getMultipleEntry(for: configuration.agency, videoType: .upcoming, sortBy: IntentSortBy.mostRecent, filterBy: { $0.isSupportedAgency })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
