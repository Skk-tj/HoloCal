//
//  holo_wtf_widget.swift
//  holo-wtf-widget
//
//  Created by Haoyi An on 2022-05-11.
//

import WidgetKit
import SwiftUI

@main
struct HoloCalWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        SmallLiveWidget()
        LivePaneWidget()
        MultipleLiveWidget()
        SmallUpcomingWidget()
        UpcomingPaneWidget()
        MultipleUpcomingWidget()
        LiveAccessoryRectangularWidget()
        UpcomingAccessoryRectangularWidget()
        LiveChannelsWidget()
        UpcomingChannelsWidget()
    }
}

struct holo_wtf_widget_Previews: PreviewProvider {
    static var previews: some View {
        SmallLiveWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .ok, video: LiveVideo.previewLive, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        SmallLiveWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .network, video: LiveVideo.previewLive, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        LivePaneWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .ok, video: LiveVideo.previewLive, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        
        LivePaneWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .noVideo, video: LiveVideo.previewLive, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        
        MultipleLiveWidgetEntryView(entry: MultipleVideoWidgetEntry(date: Date(), status: .noVideo, videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        
        MultipleLiveWidgetEntryView(entry: MultipleVideoWidgetEntry(date: Date(), status: .network, videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
