//
//  VideoPaneView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoPaneView: View {
    let video: LiveVideo
    let videoType: VideoType
    
    @State var isShowingCollabSheet: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VideoThumbnailView(video: video)
                
                VStack(alignment: .leading) {
                    VideoTitleView(title: video.title)
                    
                    PaneViewChannelInfoView(video: video)
                    
                    HStack {
                        switch videoType {
                        case .live:
                            ViewerCounterView(viewer: video.liveViewers ?? 0, memberOnly: video.isMengen)
                                .padding(.trailing)
                            
                            BlockLiveTimeView(liveTime: video.startActual)
                        case .upcoming:
                            BlockUpcomingTimeView(liveSchedule: video.startScheduled)
                                .padding(.trailing)
                            if video.isMengen {
                                BlockMemberOnlyView()
                                    .padding(.trailing)
                            }
                            if video.isPremiere {
                                BlockVideoTypeView()
                            }
                        case .past:
                            BlockPastTimeView(endedAt: video.endedAt)
                                .padding(.trailing)
                            if video.isMengen {
                                BlockMemberOnlyView()
                                    .padding(.trailing)
                            }
                        }
                    }
                    .padding(.top, 5)
                    
                    Divider()
                    
                    PaneViewButtonRowView(video: video, showCalendar: videoType == .upcoming)
                        .padding(.top)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            
            HStack(alignment: .top) {
                switch videoType {
                case .live:
                    VStack(alignment: .leading) {
                        LiveTagView()
                        TopicTagView(topicId: video.topicId)
                            .padding(.leading)
                    }
                case .upcoming, .past:
                    TopicTagView(topicId: video.topicId)
                        .padding()
                    Spacer()
                }
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct VideoPaneView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPaneView(video: LiveVideo.previewLive, videoType: .live)
        VideoPaneView(video: LiveVideo.previewLive, videoType: .live).preferredColorScheme(.dark)
    }
}
