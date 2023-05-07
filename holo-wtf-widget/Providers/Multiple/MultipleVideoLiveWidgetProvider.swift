//
//  MultipleLiveWidgetProvider.swift
//  holo-wtf
//
//
//

import WidgetKit

struct MultipleVideoLiveWidgetProvider: MultipleVideoIntentTimelineProvider {
    typealias Entry = MultipleVideoWidgetEntry
    typealias Intent = LiveWidgetIntent
    
    let videoType: VideoType = .live
    let sortBy: IntentSortBy = .mostRecent
    
    let prefix: Int
    let imageGet: MultipleVideoImageGetMethod
    
    init(prefix: Int, imageGet: MultipleVideoImageGetMethod) {
        self.prefix = prefix
        self.imageGet = imageGet
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency }, prefix: self.prefix, imageGet: self.imageGet))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries: [MultipleVideoWidgetEntry] = [await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency }, prefix: self.prefix, imageGet: self.imageGet)]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
