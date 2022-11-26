//
//  VideoWidgetProvider.swift
//  holo-wtf
//
//
//

import Foundation
import WidgetKit

struct VideoWidgetProvider: TimelineProvider {
    typealias Entry = SingleVideoWidgetEntry
    
    let url: String
    let sortStrategy: (LiveVideo, LiveVideo) -> Bool
    
    func placeholder(in context: Context) -> Entry {
        return SingleVideoWidgetEntry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SingleVideoWidgetEntry) -> ()) {
        Task {
            completion(await getEntry(url: url, sortBy: sortStrategy, filterBy: { $0.isHololive || $0.isNijisanji }))
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            let entries: [SingleVideoWidgetEntry] = [await getEntry(url: url, sortBy: sortStrategy, filterBy: { $0.isHololive || $0.isNijisanji })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
