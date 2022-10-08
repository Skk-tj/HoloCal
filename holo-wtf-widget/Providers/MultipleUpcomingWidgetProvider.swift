//
//  MultipleUpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct MultipleUpcomingWidgetProvider: TimelineProvider {
    typealias Entry = MultipleVideoWidgetEntry
    
    func placeholder(in context: Context) -> Entry {
        return MultipleVideoWidgetEntry(date: Date(), status: .ok, videoLeft: widgetSampleVideo, thumbnailDataLeft: Data(), videoRight: widgetSampleVideo, thumbnailDataRight: Data())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getMultipleEntry(url: hololiveWidgetUpcomingURL, sortBy: upcomingSortStrategy, filterBy: {$0.isHololive}))
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries: [MultipleVideoWidgetEntry] = [await getMultipleEntry(url: hololiveWidgetUpcomingURL, sortBy: upcomingSortStrategy, filterBy: {$0.isHololive})]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
