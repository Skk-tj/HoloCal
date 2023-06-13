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
                
                VideoTitleView(title: video.title)
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    PaneViewChannelInfoView(video: video)
                    
                    HStack {
                        switch videoType {
                        case .live:
                            if video.isMengen {
                                BlockMemberOnlyView()
                                    .padding(.trailing)
                            } else {
                                ViewerCounterView(viewer: video.liveViewers ?? 0, memberOnly: video.isMengen)
                                    .padding(.trailing)
                            }
                            
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
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .padding(.horizontal)
                
                PaneViewButtonRowView(video: video, showNotification: videoType == .upcoming)
                    .padding(.top)
                    .padding(.horizontal)
            }
            .padding(.bottom)
            
            HStack(alignment: .top) {
                switch videoType {
                case .live:
                    VStack(alignment: .leading) {
                        LiveTagView()
                        TopicTagView(topicId: video.topicId)
                    }
                    .padding(.top)
                    .padding(.leading)
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
        VideoPaneView(video: LiveVideo.previewLive2, videoType: .live)
        VideoPaneView(video: LiveVideo.previewLiveMemberOnly, videoType: .live)
        VideoPaneView(video: LiveVideo.previewLive, videoType: .live).preferredColorScheme(.dark)
    }
}
