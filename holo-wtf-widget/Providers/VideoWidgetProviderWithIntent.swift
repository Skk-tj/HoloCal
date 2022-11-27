//
//  LiveWidgetProvider.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-22.
//

import WidgetKit
import Algorithms

struct VideoWidgetProvider: IntentTimelineProvider {
    let videoType: VideoType
    
    func placeholder(in context: Context) -> SingleVideoWidgetEntry {
        return SingleVideoWidgetEntry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data())
    }
    
    func getSnapshot(for configuration: SelectAgencyIntent, in context: Context, completion: @escaping (SingleVideoWidgetEntry) -> ()) {
        Task {
            completion(await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isHololive || $0.isNijisanji }))
        }
    }
    
    func getTimeline(for configuration: SelectAgencyIntent, in context: Context, completion: @escaping (Timeline<SingleVideoWidgetEntry>) -> ()) {
        Task {
            let entries: [SingleVideoWidgetEntry] = [await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isHololive || $0.isNijisanji })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
    
    func recommendations() -> [IntentRecommendation<SelectAgencyIntent>] {
        let intentAgencyToString: [IntentAgency: String] = [
            .unknown: "All",
            .hololive: "Hololive",
            .nijisanji: "Nijisanji"
        ]
        
        let intentSortByToString: [IntentSortBy: String] = [
            .mostViewer: "Most Viewer",
            .mostRecent: "Most Recent"
        ]
        
        switch videoType {
        case .live:
            let availableSortBy: [IntentSortBy] = [.mostViewer, .mostRecent]
            let availableAgency: [IntentAgency] = [.unknown, .hololive, .nijisanji]
            
            let result: [IntentRecommendation<SelectAgencyIntent>] = product(availableSortBy, availableAgency).map { pair in
                let intent = SelectAgencyIntent()
                intent.sortBy = pair.0
                intent.agency = pair.1
                
                let text = "\(intentSortByToString[pair.0]!) Stream (\(intentAgencyToString[pair.1]!))"
                
                return IntentRecommendation(intent: intent, description: text)
            }
            
            return result
        case .upcoming:
            let availableSortBy: [IntentSortBy] = [.mostRecent]
            let availableAgency: [IntentAgency] = [.unknown, .hololive, .nijisanji]
            
            let result: [IntentRecommendation<SelectAgencyIntent>] = product(availableSortBy, availableAgency).map { pair in
                let intent = SelectAgencyIntent()
                intent.sortBy = pair.0
                intent.agency = pair.1
                
                let text = "\(intentSortByToString[pair.0]!) Stream (\(intentAgencyToString[pair.1]!))"
                
                return IntentRecommendation(intent: intent, description: text)
            }
            
            return result
        }
        
        
    }
}
