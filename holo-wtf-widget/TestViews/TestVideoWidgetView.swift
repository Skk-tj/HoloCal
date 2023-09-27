//
//  SwiftUIView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
#Preview(as: .systemSmall, using: UpcomingWidget(), widget: {
    SingleUpcomingWidget()
}, timelineProvider: {
    AppIntentVideoUpcomingWidgetProvider()
})
