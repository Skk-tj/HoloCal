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
        switch entry.status {
        case .ok:
            if let video = entry.video {
                SmallLiveWidgetView(live: video, avatarData: entry.avatarData)
            } else {
                Text("NO_ONE_IS_STREAMING")
            }
        case .noVideo:
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            }
        case .network:
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NETWORK_ERROR")
                
                Spacer()
            }
        }
    }
}

struct LivePaneWidgetEntryView: View {
    var entry: LiveWidgetProvider.Entry
    
    var body: some View {
        switch entry.status {
        case .ok:
            if let video = entry.video {
                LiveWidgetView(live: video, thumbnailData: entry.thumbnailData, avatarData: entry.avatarData)
            } else {
                Text("NO_ONE_IS_STREAMING")
            }
        case .noVideo:
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            }
        case .network:
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NETWORK_ERROR")
                
                Spacer()
            }
        }
    }
}

struct MultipleLiveWidgetEntryView: View {
    var entry: MultipleLiveWidgetProvider.Entry
    
    var body: some View {
        switch entry.status {
        case .ok:
            if let videoLeft = entry.videoLeft {
                MultipleLiveWidgetView(leftVideo: videoLeft, leftVideoThumbnail: entry.thumbnailDataLeft, rightVideo: entry.videoRight, rightVideoThumbnail: entry.thumbnailDataRight)
            }
        case .noVideo:
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            }
        case .network:
            VStack {
                HStack {
                    Text("LIVE_WIDGET_TITLE")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text("NETWORK_ERROR")
                
                Spacer()
            }
        }
    }
}
