//
//  VideoWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct VideoWidgetView: View {
    let video: LiveVideo
    let thumbnailData: Data
    let avatarData: Data
    let videoType: VideoType
    
    var body: some View {
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
                    .frame(maxHeight: .infinity)
                    .font(.headline)
                    .lineLimit(2, reservesSpace: false)
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
}

struct VideoWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        VideoWidgetView(video: LiveVideo.previewLive, thumbnailData: Data(), avatarData: Data(), videoType: .live)
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
        #if os(iOS)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        #endif
    }
}
