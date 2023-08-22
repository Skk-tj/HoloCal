//
//  CountIntentTimelineProvider.swift
//  holo-wtf
//
//
//

import Foundation
import WidgetKit

protocol CountIntentTimelineProvider: IntentTimelineProvider where Entry == VideoCountEntry, Intent: AgencyIntent {
    var videoType: VideoType { get }
}

extension CountIntentTimelineProvider {
    func placeholder(in context: TimelineProviderContext) -> Entry {
        return Entry(date: .now, status: .ok, count: 4, agency: .hololive)
    }
    
    func getSnapshot(for configuration: Intent, in context: TimelineProviderContext, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getCountEntry(for: configuration.agency, videoType: videoType, filterBy: { $0.isSupportedAgency }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: TimelineProviderContext, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries = [await getCountEntry(for: configuration.agency, videoType: videoType, filterBy: { $0.isSupportedAgency })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
    
    func recommendations() -> [IntentRecommendation<Intent>] {
        let availableAgency: [IntentAgency] = [.unknown, .hololive, .nijisanji, .react, .nanashiInc, .noriPro, .vspo]
        
        let result: [IntentRecommendation<Intent>] = availableAgency.map { item in
            let intent = Intent()
            intent.agency = item
            
            let text = "\(IntentSortBy.mostRecent.localizedName) (\(getIntentVideoTypeLocalizedName(videoType))) (\(item.localizedName))"
            
            return IntentRecommendation(intent: intent, description: text)
        }
        
        return result
    }
}
