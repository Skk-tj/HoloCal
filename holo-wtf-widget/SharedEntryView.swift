//
//  SharedEntryView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct LiveTitleView: View {
    var body: some View {
        HStack {
            Label("LIVE_WIDGET_TITLE", systemImage: "person.wave.2.fill")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}

struct UpcomingTitleView: View {
    var body: some View {
        HStack {
            Label("UPCOMING_WIDGET_TITLE", systemImage: "clock")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}

struct VideoLiveWidgetEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallLiveWidgetEntryView(entry: entry)
        case .systemLarge:
            LivePaneWidgetEntryView(entry: entry)
        case .accessoryRectangular:
            LiveAccessoryRectangularWidgetEntryView(entry: entry)
        case .accessoryCorner:
            LiveAccessoryCornerEntryView(entry: entry)
        case .accessoryCircular:
            LiveAccessoryCircularWidgetEntryView(entry: entry)
        default:
            EmptyView()
        }
    }
}

struct SmallLiveWidgetEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: {
            if let video = entry.video {
                Spacer()
                SmallLiveWidgetView(live: video, avatarData: entry.avatarData)
            } else {
                Spacer()
                Text("NO_ONE_IS_STREAMING")
                Spacer()
            }
        }, titleView: {
            LiveTitleView()
        })
    }
}

struct LivePaneWidgetEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: {
            if let video = entry.video {
                LiveWidgetView(live: video, thumbnailData: entry.thumbnailData, avatarData: entry.avatarData)
            } else {
                Spacer()
                Text("NO_ONE_IS_STREAMING")
                Spacer()
            }
        }, titleView: {
            LiveTitleView()
        })
        .frame(width: .infinity)
    }
}

struct VideoUpcomingWidgetEntryView: View {
    var entry: VideoUpcomingWidgetProvider.Entry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallUpcomingWidgetEntryView(entry: entry)
        case .systemLarge:
            UpcomingPaneWidgetEntryView(entry: entry)
        case .accessoryRectangular:
            UpcomingAccessoryRectangularWidgetEntryView(entry: entry)
        case .accessoryCorner:
            UpcomingAccessoryCornerEntryView(entry: entry)
        case .accessoryCircular:
            UpcomingAccessoryCircularWidgetEntryView(entry: entry)
        default:
            EmptyView()
        }
    }
}

struct SmallUpcomingWidgetEntryView: View {
    var entry: VideoUpcomingWidgetProvider.Entry
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: {
            if let video = entry.video {
                SmallUpcomingWidgetView(upcoming: video, avatarData: entry.avatarData)
            } else {
                Spacer()
                Text("NO_ONE_IS_STREAMING")
                Spacer()
            }
        }, titleView: {
            UpcomingTitleView()
        })
    }
}

struct UpcomingPaneWidgetEntryView: View {
    var entry: VideoUpcomingWidgetProvider.Entry
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: {
            if let video = entry.video {
                UpcomingWidgetView(upcoming: video, thumbnailData: entry.thumbnailData, avatarData: entry.avatarData)
            } else {
                Spacer()
                Text("NO_ONE_IS_STREAMING")
                Spacer()
            }
        }, titleView: {
            UpcomingTitleView()
        })
    }
}

struct LiveAccessoryRectangularWidgetEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            LiveAccessoryRectangularWidgetView(live: video)
        } else {
            VStack(alignment: .leading) {
                Label("LIVE_WIDGET_TITLE_NON_BOLD", systemImage: "person.wave.2.fill")
                    .font(.headline)
                    .widgetAccentable()
                
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct UpcomingAccessoryRectangularWidgetEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            UpcomingAccessoryRectangularWidgetView(upcoming: video)
        } else {
            VStack(alignment: .leading) {
                Label("UPCOMING_WIDGET_TITLE_NON_BOLD", systemImage: "clock")
                    .font(.headline)
                    .widgetAccentable()
                
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct LiveAccessoryCircularWidgetEntryView: View {
    var entry: VideoLiveWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            LiveAccessoryCircularView(live: video, avatarData: entry.avatarData)
        } else {
            Text("N/A")
        }
    }
}

struct UpcomingAccessoryCircularWidgetEntryView: View {
    var entry: VideoUpcomingWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            LiveAccessoryCircularView(live: video, avatarData: entry.avatarData)
        } else {
            Text("N/A")
        }
    }
}
