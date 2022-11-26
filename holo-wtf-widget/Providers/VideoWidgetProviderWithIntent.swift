//
//  LiveWidgetProvider.swift
//  holo-wtf
//
//
//

import WidgetKit

struct VideoWidgetProviderWithIntent: IntentTimelineProvider {
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
}
