//
//  LiveWidgetProvider.swift
//  holo-wtf
//
//
//

import WidgetKit

struct LiveWidgetProvider: TimelineProvider {
    typealias Entry = SingleVideoWidgetEntry
    
    func placeholder(in context: Context) -> Entry {
        return SingleVideoWidgetEntry(date: Date(), video: widgetSampleVideo, status: .ok, avatarData: Data(), thumbnailData: Data())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SingleVideoWidgetEntry) -> ()) {
        Task {
            completion(await getEntry(url: hololiveLiveURL, sort: liveSortStrategy, filter: { $0.isHololive }))
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            let entries: [SingleVideoWidgetEntry] = [await getEntry(url: hololiveLiveURL, sort: liveSortStrategy, filter: { $0.isHololive })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
