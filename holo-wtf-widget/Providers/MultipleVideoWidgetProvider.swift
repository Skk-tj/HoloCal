//
//  MultipleLiveWidgetProvider.swift
//  holo-wtf
//
//
//

import WidgetKit

struct MultipleVideoWidgetProvider: TimelineProvider {
    typealias Entry = MultipleVideoWidgetEntry
    
    let url: String
    let sortStrategy: (any LiveVideo, any LiveVideo) -> Bool
    
    func placeholder(in context: Context) -> Entry {
        return MultipleVideoWidgetEntry(date: Date(), status: .ok, videoLeft: widgetSampleVideo, thumbnailDataLeft: Data(), videoRight: widgetSampleVideo, thumbnailDataRight: Data())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getMultipleEntry(url: url, sortBy: sortStrategy, filterBy: {$0.isHololive}))
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries: [MultipleVideoWidgetEntry] = [await getMultipleEntry(url: url, sortBy: sortStrategy, filterBy: {$0.isHololive})]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
