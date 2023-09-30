//
//  SingleVideoWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct SingleVideoWatchView: View {
    let video: LiveVideo
    let videoType: VideoType
    
    @State var selection = 0
    
    @Namespace var namespace
    
    var body: some View {
        getViewThatFitsVersion()
            .userActivity(UserActivityKeys.handOffOpenStreamUrl, element: video.id) { _, activity in
                activity.isEligibleForHandoff = true
                activity.isEligibleForSearch = false
                activity.isEligibleForPrediction = false
                activity.isEligibleForPublicIndexing = false
                activity.webpageURL = video.url
            }
    }
    
    @available(watchOS 10.0, *)
    var tabView: some View {
        TabView(selection: $selection) {
            VStack {
                MainPhotoView(imageURL: video.thumbnailURL)
                
                VStack(alignment: .leading) {
                    Text(video.title)
                        .font(.headline)
                    
                    if let topicId = video.topicId {
                        Text(topicId)
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
            }
            .tag(0)
            
            VStack(alignment: .leading) {
                HStack {
                    LiveAvatarView(url: video.channel.photo, avatarRadius: 36, needOutline: false)
                        .matchedGeometryEffect(id: "avatar", in: namespace, isSource: selection != 0)
                    ChannelNameView(channel: video.channel, nameLineLimit: false)
                }
                .padding(.bottom)
                
                switch videoType {
                case .live:
                    BlockLiveTimeView(liveTime: video.startActual)
                        .padding(.bottom)
                    ViewerCounterView(viewer: video.liveViewers ?? 0, memberOnly: video.isMengen)
                case .upcoming:
                    BlockUpcomingTimeView(liveSchedule: video.startScheduled)
                        .padding(.bottom)
                    if video.isMengen {
                        BlockMemberOnlyView()
                            .padding(.bottom)
                    } else if video.isPremiere {
                        BlockVideoTypeView()
                    }
                case .past:
                    BlockPastTimeView(endedAt: video.endedAt)
                        .padding(.bottom)
                    if video.isMengen {
                        BlockMemberOnlyView()
                    }
                }
            }
            .tag(1)
        }
        .tabViewStyle(.verticalPage)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                LiveAvatarView(url: video.channel.photo, avatarRadius: 36, needOutline: false)
                    .matchedGeometryEffect(id: "avatar", in: namespace, isSource: selection == 0)
            }
        }
    }
    
    var scrollView: some View {
        ScrollView {
            MainPhotoView(imageURL: video.thumbnailURL)
            
            VStack(alignment: .leading) {
                Text(video.title)
                    .font(.headline)
                
                if let topicId = video.topicId {
                    Text(topicId)
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
                
                Divider()
                
                HStack {
                    LiveAvatarView(url: video.channel.photo, avatarRadius: 36, needOutline: false)
                    ChannelNameView(channel: video.channel, nameLineLimit: false)
                }
                .padding(.vertical)
                
                VStack(alignment: .leading) {
                    switch videoType {
                    case .live:
                        BlockLiveTimeView(liveTime: video.startActual)
                            .padding(.bottom)
                        ViewerCounterView(viewer: video.liveViewers ?? 0, memberOnly: video.isMengen)
                    case .upcoming:
                        BlockUpcomingTimeView(liveSchedule: video.startScheduled)
                            .padding(.bottom)
                        if video.isMengen {
                            BlockMemberOnlyView()
                                .padding(.bottom)
                        }
                        if video.isPremiere {
                            BlockVideoTypeView()
                        }
                    case .past:
                        BlockPastTimeView(endedAt: video.endedAt)
                            .padding(.bottom)
                        if video.isMengen {
                            BlockMemberOnlyView()
                        }
                    }
                }
            }
            // .frame(width: .infinity)
            .padding()
        }
    }
    
    @ViewBuilder
    func getViewThatFitsVersion() -> some View {
        if #available(watchOS 10.0, *) {
            tabView
        } else {
            scrollView
        }
    }
}

struct SingleVideoWatchView_Previews: PreviewProvider {
    static var previews: some View {
        SingleVideoWatchView(video: .previewLive2, videoType: .live)
        SingleVideoWatchView(video: .previewLive2, videoType: .upcoming)
        SingleVideoWatchView(video: .previewLive2, videoType: .past)
    }
}
