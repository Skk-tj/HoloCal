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
        if context.isPreview && context.family == .accessoryRectangular {
            completion(SingleVideoWidgetEntry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data()))
            return
        }
#if os(watchOS)
        if context.isPreview && context.family == .accessoryCorner {
            completion(SingleVideoWidgetEntry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data()))
            return
        }
#endif
        
        Task {
            completion(await getEntryWithIntent(for: configuration.agency, videoType: .live, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            let entries: [SingleVideoWidgetEntry] = [await getEntryWithIntent(for: configuration.agency, videoType: .live, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
    
    func recommendations() -> [IntentRecommendation<Intent>] {
        let availableSortBy: [IntentSortBy] = [.mostViewer, .mostRecent]
        let availableAgency: [IntentAgency] = [.unknown, .hololive, .nijisanji, .react, .nanashiInc]

        let result: [IntentRecommendation<Intent>] = product(availableSortBy, availableAgency).map { pair in
            let intent = LiveWidgetIntent()
            intent.sortBy = pair.0
            intent.agency = pair.1
            
            let text = "\(pair.0.localizedName) (\(getIntentVideoTypeLocalizedName(.live))) (\(pair.1.localizedName))"

            return IntentRecommendation(intent: intent, description: text)
        }

        return result
    }
}
