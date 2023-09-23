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

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
protocol VideoAppIntentTimelineProvider: AppIntentTimelineProvider where Entry == AppIntentSingleVideoWidgetEntry, Intent: AgencyAppIntent {
    var videoType: VideoType { get }
    var sortBy: IntentSortByAppEnum { get }
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

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
extension VideoAppIntentTimelineProvider {
    func placeholder(in context: TimelineProviderContext) -> Entry {
        return Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data(), agency: nil)
    }
    
    func snapshot(for configuration: Intent, in context: TimelineProviderContext) async -> Entry {
#if os(watchOS)
        if context.isPreview && context.family == .accessoryRectangular {
            return Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data(), agency: nil)
        }
        
        if context.isPreview && context.family == .accessoryCorner {
            return Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data(), agency: nil)
        }
#endif
        
        return await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency })
    }
    
    func timeline(for configuration: Intent, in context: TimelineProviderContext) async -> Timeline<Entry> {
        let entries: [Entry] = [await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency })]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        return timeline
    }
    
    func recommendations() -> [AppIntentRecommendation<Intent>] {
        let availableAgency: [IntentAgencyAppEnum] = [.hololive, .nijisanji, .react, .nanashiInc, .noriPro, .vspo]
        
        let result: [AppIntentRecommendation<Intent>] = availableAgency.map { item in
            var intent = Intent()
            intent.agency = item
            
            let localizedSortByIntent = String(localized: IntentSortByAppEnum.mostRecent.localizedStringResource)
            let localizedVideoType = getIntentVideoTypeLocalizedName(videoType)
            let localizedAgency = String(localized: item.localizedStringResource)
            
            let text = "\(localizedSortByIntent) (\(localizedVideoType)) (\(localizedAgency))"
            
            return AppIntentRecommendation(intent: intent, description: text)
        }
        
        return result
    }
}
