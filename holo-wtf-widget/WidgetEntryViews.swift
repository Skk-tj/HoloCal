//
//  WidgetEntryViews.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI

struct SmallLiveWidgetEntryView: View {
    var entry: LiveWidgetProvider.Entry
    
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
            HStack {
                Label("LIVE_WIDGET_TITLE", systemImage: "person.wave.2.fill")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
        })
    }
}

struct LivePaneWidgetEntryView: View {
    var entry: LiveWidgetProvider.Entry
    
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
            HStack {
                Label("LIVE_WIDGET_TITLE", systemImage: "person.wave.2.fill")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
        })
    }
}

struct MultipleLiveWidgetEntryView: View {
    var entry: MultipleLiveWidgetProvider.Entry
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: {
            if let videoLeft = entry.videoLeft, let videoRight = entry.videoRight {
                MultipleLiveWidgetView(leftVideo: videoLeft, leftVideoThumbnail: entry.thumbnailDataLeft, rightVideo: videoRight, rightVideoThumbnail: entry.thumbnailDataRight)
            }
            
            if (entry.videoRight == nil) {
                if let videoLeft = entry.videoLeft {
                    LiveWidgetMediumView(video: videoLeft, videoThumbnail: entry.thumbnailDataLeft)
                } else {
                    Spacer()
                    Text("NO_ONE_IS_STREAMING")
                    Spacer()
                }
            }
        }, titleView: {
            HStack {
                Label("LIVE_WIDGET_TITLE", systemImage: "person.wave.2.fill")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
        })
    }
}

struct SmallUpcomingWidgetEntryView: View {
    var entry: UpcomingWidgetProvider.Entry
    
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
            HStack {
                Label("UPCOMING_WIDGET_TITLE", systemImage: "clock")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
        })
    }
}

struct UpcomingPaneWidgetEntryView: View {
    var entry: UpcomingWidgetProvider.Entry
    
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
            HStack {
                Label("UPCOMING_WIDGET_TITLE", systemImage: "clock")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
        })
    }
}

struct MultipleUpcomingWidgetEntryView: View {
    var entry: MultipleUpcomingWidgetProvider.Entry
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: {
            if let videoLeft = entry.videoLeft, let videoRight = entry.videoRight {
                MultipleUpcomingWidgetView(leftVideo: videoLeft, leftVideoThumbnail: entry.thumbnailDataLeft, rightVideo: videoRight, rightVideoThumbnail: entry.thumbnailDataRight)
            }
            
            if (entry.videoRight == nil) {
                if let videoLeft = entry.videoLeft {
                    UpcomingWidgetMediumView(video: videoLeft, videoThumbnail: entry.thumbnailDataLeft)
                } else {
                    Spacer()
                    Text("NO_ONE_IS_STREAMING")
                    Spacer()
                }
            }
        }, titleView: {
            HStack {
                Label("UPCOMING_WIDGET_TITLE", systemImage: "clock")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
        })
    }
}

@available(iOSApplicationExtension 16.0, *)
struct LiveAccessoryRectangularWidgetEntryView: View {
    var entry: LiveWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            LiveAccessoryRectangularWidgetView(live: video)
        } else {
            VStack(alignment: .leading) {
                Label("LIVE_WIDGET_TITLE", systemImage: "person.wave.2.fill")
                    .font(.caption)
                
                Text("NO_ONE_IS_STREAMING")
            }
        }
    }
}

@available(iOSApplicationExtension 16.0, *)
struct UpcomingAccessoryRectangularWidgetEntryView: View {
    var entry: UpcomingWidgetProvider.Entry
    
    var body: some View {
        if let video = entry.video {
            UpcomingAccessoryRectangularWidgetView(upcoming: video)
        } else {
            VStack(alignment: .leading) {
                Label("UPCOMING_WIDGET_TITLE", systemImage: "clock")
                    .font(.caption)
                
                Text("NO_ONE_IS_STREAMING")
            }
        }
    }
}
