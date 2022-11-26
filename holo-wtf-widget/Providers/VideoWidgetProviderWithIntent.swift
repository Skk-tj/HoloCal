//
//  LiveWidgetProvider.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-22.
//

import WidgetKit

struct VideoWidgetProviderWithIntent: IntentTimelineProvider {
    let videoType: VideoType
    let sortStrategy: (LiveVideo, LiveVideo) -> Bool
    
    func placeholder(in context: Context) -> SingleVideoWidgetEntry {
        return SingleVideoWidgetEntry(date: Date(), status: .ok, video: widgetSampleVideo, avatarData: Data(), thumbnailData: Data())
    }
    
    func getSnapshot(for configuration: SelectAgencyIntent, in context: Context, completion: @escaping (SingleVideoWidgetEntry) -> ()) {
        Task {
            completion(await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: sortStrategy, filterBy: { $0.isHololive || $0.isNijisanji }))
        }
    }
    
    func getTimeline(for configuration: SelectAgencyIntent, in context: Context, completion: @escaping (Timeline<SingleVideoWidgetEntry>) -> ()) {
        Task {
            let entries: [SingleVideoWidgetEntry] = [await getEntryWithIntent(for: configuration.agency, videoType: videoType, sortBy: sortStrategy, filterBy: { $0.isHololive || $0.isNijisanji })]
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
