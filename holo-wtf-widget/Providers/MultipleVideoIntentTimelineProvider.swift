//
//  MultipleVideoIntentTimelineProvider.swift
//  holo-wtf
//
//
//

import WidgetKit

protocol MultipleVideoIntentTimelineProvider: IntentTimelineProvider where Entry == MultipleVideoWidgetEntry, Intent: AgencyIntent {
    var videoType: VideoType { get }
    var sortBy: IntentSortBy { get }
    
    var prefix: Int { get }
    var imageGet: MultipleVideoImageGetMethod { get }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
protocol MultipleVideoAppIntentTimelineProvider: AppIntentTimelineProvider where Entry == AppIntentMultipleVideoWidgetEntry, Intent: AgencyAppIntent {
    var videoType: VideoType { get }
    var sortBy: IntentSortByAppEnum { get }
    
    var prefix: Int { get }
    var imageGet: MultipleVideoImageGetMethod { get }
}

extension MultipleVideoIntentTimelineProvider {
    func placeholder(in context: Context) -> Entry {
        return Entry(date: Date(), status: .ok, videos: [LiveVideo.previewLive, LiveVideo.previewLiveMemberOnly], images: [Data(), Data(), Data(), Data()], agency: .unknown)
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        Task {
            completion(await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency }, prefix: self.prefix, imageGet: self.imageGet))
        }
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        Task {
            let entries: [MultipleVideoWidgetEntry] = [await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency }, prefix: self.prefix, imageGet: self.imageGet)]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
extension MultipleVideoAppIntentTimelineProvider {
    func placeholder(in context: TimelineProviderContext) -> Entry {
        return Entry(date: Date(), status: .ok, videos: [LiveVideo.previewLive, LiveVideo.previewLiveMemberOnly], images: [Data(), Data(), Data(), Data()], agency: nil)
    }
    
    func snapshot(for configuration: Intent, in context: TimelineProviderContext) async -> Entry {
        return await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency }, prefix: self.prefix, imageGet: self.imageGet)
    }
    
    func timeline(for configuration: Intent, in context: TimelineProviderContext) async -> Timeline<Entry> {
        let entries: [AppIntentMultipleVideoWidgetEntry] = [await getMultipleEntry(for: configuration.agency, videoType: videoType, sortBy: sortBy, filterBy: { $0.isSupportedAgency }, prefix: self.prefix, imageGet: self.imageGet)]
        return Timeline(entries: entries, policy: .atEnd)
    }
}
