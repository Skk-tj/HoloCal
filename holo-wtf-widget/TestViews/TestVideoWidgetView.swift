//
//  SwiftUIView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct TestVideoWidgetView: View {
    let video: LiveVideo
    let thumbnailData: Data
    let avatarData: Data
    let videoType: VideoType
    
    var body: some View {
        VStack {
            LiveTitleView()
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    if let image = UIImage(data: thumbnailData) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(1.78, contentMode: .fit)
                            .cornerRadius(10)
                    } else {
                        Image("WidgetPlaceholder")
                            .resizable()
                            .aspectRatio(1.78, contentMode: .fit)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text(video.title)
                        .font(.headline)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        SmallWidgetAvatarView(avatarData: avatarData)
                        
                        ChannelNameView(channel: video.channel)
                    }
                    
                    switch videoType {
                    case .live:
                        HStack {
                            ViewerCounterView(viewer: video.liveViewers ?? 0, memberOnly: video.isMengen)
                                .padding(.trailing)
                            
                            BlockLiveTimeView(liveTime: video.startActual)
                        }
                    case .upcoming:
                        HStack {
                            BlockUpcomingTimeView(liveSchedule: video.startScheduled)
                                .padding(.trailing)
                            if video.isMengen {
                                BlockMemberOnlyView()
                                    .padding(.trailing)
                            }
                            if video.isPremiere {
                                BlockVideoTypeView()
                            }
                        }
                    case .past:
                        HStack {
                            BlockPastTimeView(endedAt: video.endedAt)
                                .padding(.trailing)
                            if video.isMengen {
                                BlockMemberOnlyView()
                                    .padding(.trailing)
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct TestVideoWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        TestVideoWidgetView(video: LiveVideo.previewLive, thumbnailData: Data(), avatarData: Data(), videoType: .live)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
