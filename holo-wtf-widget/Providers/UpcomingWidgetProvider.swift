//
//  UpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit

struct UpcomingWidgetProvider: TimelineProvider {    
    typealias Entry = SingleVideoWidgetEntry
    
    func placeholder(in context: Context) -> Entry {
        return SingleVideoWidgetEntry(date: Date(), video: widgetSampleVideo, status: .ok, avatarData: Data(), thumbnailData: Data())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getEntry(url: hololiveWidgetUpcomingURL, sort: upcomingSortStrategy, filter: { $0.isHololive }))
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries: [SingleVideoWidgetEntry] = [await getEntry(url: hololiveWidgetUpcomingURL, sort: upcomingSortStrategy, filter: { $0.isHololive })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
