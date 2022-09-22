//
//  complications.swift
//  complications
//
//  Created by Haoyi An on 2022-09-18.
//

import WidgetKit
import SwiftUI

@main
struct ComplicationsWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        LiveAccessoryRectangularWidget()
        UpcomingAccessoryRectangularWidget()
    }
}

struct complications_Previews: PreviewProvider {
    static var previews: some View {
        LiveAccessoryRectangularWidgetEntryView(entry: SingleVideoWidgetEntry(date: Date(), video: LiveVideo.previewLive, status: .ok, avatarData: Data(), thumbnailData: Data()))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
