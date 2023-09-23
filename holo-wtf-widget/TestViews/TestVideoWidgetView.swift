//
//  SwiftUIView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

//#Preview(as: .systemSmall, widget: {
//    SingleLiveWidget()
//}, timeline: {
//    AppIntentSingleVideoWidgetEntry(date: .now, status: .ok, video: .previewLive, avatarData: Data(), thumbnailData: Data(), agency: .hololive)
//})

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentSmallWidget_Preview: PreviewProvider {
    static var previews: some View {
        AppIntentSmallWidgetEntryView(entry: AppIntentSingleVideoWidgetEntry(date: .now, status: .ok, video: .previewLive, avatarData: Data(), thumbnailData: Data(), agency: .hololive), videoType: .live)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
