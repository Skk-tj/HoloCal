//
//  VideoIntentTimelineProvider.swift
//  holo-wtf
//
//
//

import WidgetKit

protocol VideoIntentTimelineProvider: IntentTimelineProvider where Entry == SingleVideoWidgetEntry, Intent: AgencyIntent {
    var videoType: VideoType { get }
    var sortBy: IntentSortBy { get }
}

extension VideoIntentTimelineProvider {
    func placeholder(in context: Context) -> Entry {
        return Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data(), agency: .unknown)
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
#if os(watchOS)
        if context.isPreview && context.family == .accessoryRectangular {
            completion(Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data(), agency: .unknown))
            return
        }
        
        if context.isPreview && context.family == .accessoryCorner {
            completion(Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data(), agency: .unknown))
            return
        }
#endif
        
        Task {
            completion(await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries: [Entry] = [await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency })]
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
