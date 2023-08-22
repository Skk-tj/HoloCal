//
//  holo_wtf_widget.swift
//  holo-wtf-widget
//
//
//

import WidgetKit
import SwiftUI

@main
struct HoloCalWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        SingleLiveWidget()
        SingleUpcomingWidget()
        SinglePastWidget()
        MultipleLiveWidget()
        MultipleUpcomingWidget()
        MultiplePastWidget()
        MultipleLiveLargeWidget()
        MultipleUpcomingLargeWidget()
        MultiplePastLargeWidget()
        Bundle2().body
    }
}

struct Bundle2: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        LiveChannelsWidget()
        UpcomingChannelsWidget()
        PastChannelsWidget()
        
        LiveCountWidget()
    }
}
