//
//  VideoUpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//
//

import WidgetKit
import Algorithms

struct VideoUpcomingWidgetProvider: IntentTimelineProvider {
    typealias Entry = SingleVideoWidgetEntry
    typealias Intent = UpcomingWidgetIntent
    
    func placeholder(in context: Context) -> Entry {
        return SingleVideoWidgetEntry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data())
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> ()) {
        if context.isPreview && context.family == .accessoryRectangular {
            completion(SingleVideoWidgetEntry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data()))
            return
        }
        
        Task {
            completion(await getEntryWithIntent(for: configuration.agency, videoType: .upcoming, sortBy: IntentSortBy.mostRecent, filterBy: { $0.isHololive || $0.isNijisanji }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            let entries: [SingleVideoWidgetEntry] = [await getEntryWithIntent(for: configuration.agency, videoType: .upcoming, sortBy: IntentSortBy.mostRecent, filterBy: { $0.isHololive || $0.isNijisanji })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
    
    func recommendations() -> [IntentRecommendation<Intent>] {
        let availableAgency: [IntentAgency] = [.unknown, .hololive, .nijisanji]
        
        let result: [IntentRecommendation<Intent>] = availableAgency.map { item in
            let intent = UpcomingWidgetIntent()
            intent.agency = item
            
            let text = "\(IntentSortBy.mostRecent.localizedName) (\(item.localizedName))"
            
            return IntentRecommendation(intent: intent, description: text)
        }
        
        return result
    }
}