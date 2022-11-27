//
//  WidgetEntryViews.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI

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
    }
}

struct MultipleLiveWidgetEntryView: View {
    var entry: MultipleVideoLiveWidgetProvider.Entry
    
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
            LiveTitleView()
        })
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

struct MultipleUpcomingWidgetEntryView: View {
    var entry: MultipleVideoUpcomingWidgetProvider.Entry
    
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
            UpcomingTitleView()
        })
    }
}

struct LiveChannelsEntryView: View {
    var entry: ChannelsLiveWidgetProvider.Entry
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: {
            if !entry.channels.isEmpty {
                LiveChannelsView(channels: entry.channels, thumbnails: entry.thumbnails)
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

struct UpcomingChannelsEntryView: View {
    var entry: ChannelsUpcomingWidgetProvider.Entry
    
    var body: some View {
        BaseVideoEntryView(entry: entry, mainView: {
            if !entry.channels.isEmpty {
                LiveChannelsView(channels: entry.channels, thumbnails: entry.thumbnails)
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
