//
//  WidgetEntryViews.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI

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
