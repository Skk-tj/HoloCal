//
//  VideoUpcomingWidgetProvider.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-11-27.
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
        let intentAgencyToString: [IntentAgency: String] = [
            .unknown: "All",
            .hololive: "Hololive",
            .nijisanji: "Nijisanji"
        ]
        
        let intentSortByToString: [IntentSortBy: String] = [
            .mostViewer: "Most Viewer",
            .mostRecent: "Most Recent"
        ]
        
        let availableAgency: [IntentAgency] = [.unknown, .hololive, .nijisanji]
        
        let result: [IntentRecommendation<Intent>] = availableAgency.map { item in
            let intent = UpcomingWidgetIntent()
            intent.agency = item
            
            let text = "\(intentSortByToString[IntentSortBy.mostRecent]!) Stream (\(intentAgencyToString[item]!))"
            
            return IntentRecommendation(intent: intent, description: text)
        }
        
        return result
    }
}
