//
//  SwiftUIView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
#Preview(as: .accessoryRectangular, using: LiveWidget(), widget: {
    SingleLiveWidget()
}, timelineProvider: {
    AppIntentVideoLiveWidgetProvider()
})

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
#Preview(as: .accessoryRectangular, using: UpcomingWidget(), widget: {
    SingleUpcomingWidget()
}, timelineProvider: {
    AppIntentVideoUpcomingWidgetProvider()
})

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
#Preview(as: .accessoryRectangular, using: PastWidget(), widget: {
    SinglePastWidget()
}, timelineProvider: {
    AppIntentVideoPastWidgetProvider()
})
