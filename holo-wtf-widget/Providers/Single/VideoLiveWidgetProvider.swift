//
//  LiveWidgetProvider.swift
//  holo-wtf
//
//
//

import WidgetKit
import Algorithms

struct VideoLiveWidgetProvider: VideoIntentTimelineProvider {
    typealias Entry = SingleVideoWidgetEntry
    typealias Intent = LiveWidgetIntent
    
    let videoType: VideoType = .live
    let sortBy: IntentSortBy = .unknown
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
#if os(watchOS)
        if context.isPreview && context.family == .accessoryRectangular {
            completion(Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data(), agency: .hololive))
            return
        }

        if context.isPreview && context.family == .accessoryCorner {
            completion(Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data(), agency: .hololive))
            return
        }
#endif
        
        Task {
            completion(await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries: [Entry] = [await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
    
    func recommendations() -> [IntentRecommendation<Intent>] {
        let availableSortBy: [IntentSortBy] = [.mostViewer, .mostRecent]
        let availableAgency: [IntentAgency] = [.unknown, .hololive, .nijisanji, .react, .nanashiInc, .noriPro, .vspo]

        let result: [IntentRecommendation<Intent>] = product(availableSortBy, availableAgency).map { pair in
            let intent = LiveWidgetIntent()
            intent.sortBy = pair.0
            intent.agency = pair.1
            
            let text = "\(pair.0.localizedName) (\(getIntentVideoTypeLocalizedName(videoType))) (\(pair.1.localizedName))"

            return IntentRecommendation(intent: intent, description: text)
        }

        return result
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentVideoLiveWidgetProvider: VideoAppIntentTimelineProvider {
    typealias Entry = AppIntentSingleVideoWidgetEntry
    typealias Intent = LiveWidget
    
    let videoType: VideoType = .live
    let sortBy: IntentSortByAppEnum = .mostRecent
    
    func snapshot(for configuration: Intent, in context: Context) async -> Entry {
#if os(watchOS)
        if context.isPreview && context.family == .accessoryRectangular {
            return Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data(), agency: .hololive)
        }
        
        if context.isPreview && context.family == .accessoryCorner {
            return Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data(), agency: .hololive)
        }
#endif
        
        return await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency })
    }
    
    func timeline(for configuration: LiveWidget, in context: Context) async -> Timeline<AppIntentSingleVideoWidgetEntry> {
        let entries: [Entry] = [await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: configuration.sortBy, filterBy: { $0.isSupportedAgency })]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        return timeline
    }
    
    func recommendations() -> [AppIntentRecommendation<LiveWidget>] {
        let availableSortBy: [IntentSortByAppEnum] = [.mostViewer, .mostRecent]
        let availableAgency: [IntentAgencyAppEnum] = [.hololive, .nijisanji, .react, .nanashiInc, .noriPro, .vspo]
        
        let result: [AppIntentRecommendation<Intent>] = product(availableSortBy, availableAgency).map { pair in
            let intent = Intent()
            intent.sortBy = pair.0
            intent.agency = pair.1
            
            let text = "\(pair.0.localizedStringResource) (\(getIntentVideoTypeLocalizedName(videoType))) (\(pair.1.localizedStringResource))"
            
            return AppIntentRecommendation(intent: intent, description: text)
        }
        
        return result
    }
}
