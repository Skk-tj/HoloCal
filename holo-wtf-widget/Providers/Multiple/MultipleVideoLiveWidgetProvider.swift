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

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentMultipleVideoLiveWidgetProvider: MultipleVideoAppIntentTimelineProvider {
    typealias Entry = AppIntentMultipleVideoWidgetEntry
    typealias Intent = LiveWidget
    
    let videoType: VideoType = .live
    let sortBy: IntentSortByAppEnum = .mostRecent
    
    let prefix: Int
    let imageGet: MultipleVideoImageGetMethod
    
    init(prefix: Int, imageGet: MultipleVideoImageGetMethod) {
        self.prefix = prefix
        self.imageGet = imageGet
    }
    
    func snapshot(for configuration: Intent, in context: Context) async -> Entry {
        return await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency }, prefix: self.prefix, imageGet: self.imageGet)
    }
    
    func timeline(for configuration: Intent, in context: Context) async -> Timeline<Entry> {
        let entries: [Entry] = [await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency }, prefix: self.prefix, imageGet: self.imageGet)]
        return Timeline(entries: entries, policy: .atEnd)
    }
}
