//
//  AccessoryRectangularEntryViews.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct VideoAccessoryRectangularWidgetEntryView<MainContent: View, ErrorContent: View>: View {
    let entry: SingleVideoWidgetEntry
    
    @ViewBuilder let mainView: (_ video: LiveVideo) -> MainContent
    @ViewBuilder let errorTitle: () -> ErrorContent
    
    var body: some View {
        if let video = entry.video {
            mainView(video)
        } else {
            VStack(alignment: .leading) {
                errorTitle()
                
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct AppIntentVideoAccessoryRectangularWidgetEntryView<MainContent: View, ErrorContent: View>: View {
    let entry: AppIntentSingleVideoWidgetEntry
    
    @ViewBuilder let mainView: (_ video: LiveVideo) -> MainContent
    @ViewBuilder let errorTitle: () -> ErrorContent
    
    var body: some View {
        if let video = entry.video {
            mainView(video)
        } else {
            VStack(alignment: .leading) {
                errorTitle()
                
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct AccessoryRectangularEntryView: View {
    let entry: SingleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        VideoAccessoryRectangularWidgetEntryView(entry: entry, mainView: { video in
            AccessoryRectangularWidgetView(video: video, videoType: videoType)
        }, errorTitle: {
            switch videoType {
            case .live:
                Label("LIVE_WIDGET_TITLE_NON_BOLD", systemImage: "person.wave.2.fill")
                    .font(.headline)
                    .widgetAccentable()
            case .upcoming:
                Label("UPCOMING_WIDGET_TITLE_NON_BOLD", systemImage: "clock")
                    .font(.headline)
                    .widgetAccentable()
            case .past:
                Label("PAST_WIDGET_TITLE_NON_BOLD", systemImage: "clock.arrow.circlepath")
                    .font(.headline)
                    .widgetAccentable()
            }
        })
        .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency.rawValue)))
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentAccessoryRectangularEntryView: View {
    let entry: AppIntentSingleVideoWidgetEntry
    let videoType: VideoType
    
    var gradientType: AnyGradient {
        switch videoType {
        case .live:
            return Color.red.gradient
        case .upcoming:
            return Color.pink.gradient
        case .past:
            return Color.blue.gradient
        }
    }
    
    var body: some View {
        AppIntentVideoAccessoryRectangularWidgetEntryView(entry: entry, mainView: { video in
            AccessoryRectangularWidgetView(video: video, videoType: videoType)
        }, errorTitle: {
            switch videoType {
            case .live:
                Label("LIVE_WIDGET_TITLE_NON_BOLD", systemImage: "person.wave.2.fill")
                    .font(.headline)
                    .widgetAccentable()
            case .upcoming:
                Label("UPCOMING_WIDGET_TITLE_NON_BOLD", systemImage: "clock")
                    .font(.headline)
                    .widgetAccentable()
            case .past:
                Label("PAST_WIDGET_TITLE_NON_BOLD", systemImage: "clock.arrow.circlepath")
                    .font(.headline)
                    .widgetAccentable()
            }
        })
        .containerBackground(gradientType, for: .widget)
        .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency?.rawValue ?? "")))
    }
}

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
