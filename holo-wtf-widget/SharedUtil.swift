//
//  SharedUtil.swift
//  holo-wtf
//
//
//

import Foundation
import WidgetKit
import Intents

protocol VideoTimelineEntry: TimelineEntry {
    var status: WidgetDataStatus { get }
}

protocol AgencyIntent: INIntent {
    var agency: IntentAgency { get set }
}

extension PastWidgetIntent: AgencyIntent { }
extension LiveWidgetIntent: AgencyIntent { }
extension UpcomingWidgetIntent: AgencyIntent { }

protocol MultipleVideoIntentTimelineProvider: IntentTimelineProvider where Entry == MultipleVideoWidgetEntry, Intent: AgencyIntent {
    var videoType: VideoType { get }
    var sortBy: IntentSortBy { get }
}

extension MultipleVideoIntentTimelineProvider {
    func placeholder(in context: Context) -> Entry {
        return Entry(date: Date(), status: .ok, videoLeft: widgetSampleVideo, thumbnailDataLeft: Data(), videoRight: widgetSampleVideo, thumbnailDataRight: Data())
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries: [MultipleVideoWidgetEntry] = [await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}

protocol ChannelsIntentTimelineProvider: IntentTimelineProvider where Entry == ChannelsEntry, Intent: AgencyIntent {
    var videoType: VideoType { get }
    var sortBy: IntentSortBy { get }
}

extension ChannelsIntentTimelineProvider {
    func placeholder(in context: Context) -> Entry {
        return Entry(date: .now, status: .ok, channels: [widgetSampleChannel], thumbnails: [Data()])
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries = [await getChannelsEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}

protocol VideoIntentTimelineProvider: IntentTimelineProvider where Entry == SingleVideoWidgetEntry, Intent: AgencyIntent {
    var videoType: VideoType { get }
    var sortBy: IntentSortBy { get }
}

extension VideoIntentTimelineProvider {
    func placeholder(in context: Context) -> Entry {
        return Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data())
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> ()) {
        if context.isPreview && context.family == .accessoryRectangular {
            completion(Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data()))
            return
        }
#if os(watchOS)
        if context.isPreview && context.family == .accessoryCorner {
            completion(Entry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data()))
            return
        }
#endif
        
        Task {
            completion(await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency }))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            let entries: [Entry] = [await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
    
    func recommendations() -> [IntentRecommendation<Intent>] {
        let availableAgency: [IntentAgency] = [.unknown, .hololive, .nijisanji, .react, .nanashiInc, .noriPro]
        
        let result: [IntentRecommendation<Intent>] = availableAgency.map { item in
            let intent = Intent()
            intent.agency = item
            
            let text = "\(IntentSortBy.mostRecent.localizedName) (\(getIntentVideoTypeLocalizedName(videoType))) (\(item.localizedName))"
            
            return IntentRecommendation(intent: intent, description: text)
        }
        
        return result
    }
}

enum WidgetDataStatus {
    case ok
    case noVideo
    case network
}
