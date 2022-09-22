//
//  holo_wtf_widget.swift
//  holo-wtf-widget
//
//
//

import WidgetKit
import SwiftUI
import Intents

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
    }
}

struct holo_wtf_widget_Previews: PreviewProvider {
    static var previews: some View {
        SmallLiveWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), video: LiveVideo.previewLive, status: .ok, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        SmallLiveWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), video: LiveVideo.previewLive, status: .network, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        LivePaneWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), video: LiveVideo.previewLive, status: .ok, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        
        LivePaneWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), video: LiveVideo.previewLive, status: .noVideo, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        
        MultipleLiveWidgetEntryView(entry: MultipleVideoWidgetEntry(date: Date(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .noVideo))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        
        MultipleLiveWidgetEntryView(entry: MultipleVideoWidgetEntry(date: Date(), videoLeft: nil, thumbnailDataLeft: Data(), videoRight: nil, thumbnailDataRight: Data(), status: .network))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
