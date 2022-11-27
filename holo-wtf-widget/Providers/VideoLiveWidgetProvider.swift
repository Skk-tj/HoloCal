//
//  LiveWidgetProvider.swift
//  holo-wtf
//
//
//

import WidgetKit
import Algorithms

struct VideoLiveWidgetProvider: IntentTimelineProvider {
    typealias Entry = SingleVideoWidgetEntry
    typealias Intent = LiveWidgetIntent
    
    func placeholder(in context: Context) -> Entry {
        return SingleVideoWidgetEntry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data())
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> ()) {
        Task {
            completion(await getEntryWithIntent(for: configuration.agency, videoType: .live, sortBy: configuration.sortBy, filterBy: { $0.isHololive || $0.isNijisanji }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            let entries: [SingleVideoWidgetEntry] = [await getEntryWithIntent(for: configuration.agency, videoType: .live, sortBy: configuration.sortBy, filterBy: { $0.isHololive || $0.isNijisanji })]
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
        
        let availableSortBy: [IntentSortBy] = [.mostViewer, .mostRecent]
        let availableAgency: [IntentAgency] = [.unknown, .hololive, .nijisanji]

        let result: [IntentRecommendation<Intent>] = product(availableSortBy, availableAgency).map { pair in
            let intent = LiveWidgetIntent()
            intent.sortBy = pair.0
            intent.agency = pair.1
            
            let text = "\(intentSortByToString[pair.0]!) Stream (\(intentAgencyToString[pair.1]!))"

            return IntentRecommendation(intent: intent, description: text)
        }

        return result
    }
}
