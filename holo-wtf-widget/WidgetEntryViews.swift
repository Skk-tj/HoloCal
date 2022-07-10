//
//  WidgetEntryViews.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-06-10.
//

import SwiftUI

struct SmallLiveWidgetEntryView: View {
    var entry: LiveWidgetProvider.Entry
    
    var body: some View {
        VStack {
            HStack {
                Text("LIVE_WIDGET_TITLE")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top)
            
            Spacer()
        
            switch entry.status {
            case .ok:
                if let video = entry.video {
                    SmallLiveWidgetView(live: video, avatarData: entry.avatarData)
                } else {
                    Text("NO_ONE_IS_STREAMING")
                    
                    Spacer()
                }
            case .noVideo:
                    Text("NO_ONE_IS_STREAMING")
                    
                    Spacer()
            case .network:
                    Text("NETWORK_ERROR")
                    
                    Spacer()
            }
        }
    }
}

struct LivePaneWidgetEntryView: View {
    var entry: LiveWidgetProvider.Entry
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.wave.2.fill")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Text("LIVE_WIDGET_TITLE")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top)
            
            Spacer()
        
            switch entry.status {
            case .ok:
                if let video = entry.video {
                    LiveWidgetView(live: video, thumbnailData: entry.thumbnailData, avatarData: entry.avatarData)
                } else {
                    Text("NO_ONE_IS_STREAMING")
                    
                    Spacer()
                }
            case .noVideo:
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            case .network:
                Text("NETWORK_ERROR")
                
                Spacer()
            }
        }
    }
}

struct MultipleLiveWidgetEntryView: View {
    var entry: MultipleLiveWidgetProvider.Entry
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.wave.2.fill")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Text("LIVE_WIDGET_TITLE")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top)
        
            switch entry.status {
            case .ok:
                if let videoLeft = entry.videoLeft, let videoRight = entry.videoRight {
                    MultipleLiveWidgetView(leftVideo: videoLeft, leftVideoThumbnail: entry.thumbnailDataLeft, rightVideo: videoRight, rightVideoThumbnail: entry.thumbnailDataRight)
                }
                
                if (entry.videoRight == nil) {
                    if let videoLeft = entry.videoLeft {
                        LiveWidgetMediumView(video: videoLeft, videoThumbnail: entry.thumbnailDataLeft)
                    } else {
                        Text("NO_ONE_IS_STREAMING")
                        
                        Spacer()
                    }
                }
            case .noVideo:
                Text("NO_ONE_IS_STREAMING")
                
                Spacer()
            case .network:
                Text("NETWORK_ERROR")
                
                Spacer()
            }
        }
    }
}
