//
//  complications.swift
//  complications
//
//
//

import WidgetKit
import SwiftUI

@main
struct ComplicationsWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        SingleLiveWidget()
        SingleUpcomingWidget()
        SinglePastWidget()
    }
}

struct complications_Previews: PreviewProvider {
    static var previews: some View {
        LiveAccessoryRectangularWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .ok, video: LiveVideo.previewLive, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
