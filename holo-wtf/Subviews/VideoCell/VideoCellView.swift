//
//  VideoCellView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoCellView: View {
    let video: LiveVideo
    let videoType: VideoType
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    var body: some View {
        HStack {
            LiveAvatarView(url: video.channel.photo)
            VStack(alignment: .leading) {
                Text(video.title)
                    .font(.headline)
                    .lineLimit(1)
                    .padding(.bottom, 5)
                
                TopicTagView(topicId: video.topicId)
                
                HStack {
                    Text(video.channel.name)
                        .font(.subheadline)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                    
                    if favourited.contains(where: {$0 == video.channel.id}) {
                        Image(systemName: "star.fill")
                            .tint(.yellow)
                    }
                }
                Divider()
                HStack {
                    switch videoType {
                    case .live:
                        if video.isMengen {
                            Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        } else {
                            Text("LIVE_CELL_VIEW_PEOPLE_WATCHING \(video.liveViewers ?? 0)")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                        LiveTimeView(liveTime: video.startActual)
                            .multilineTextAlignment(.trailing)
                    case .upcoming:
                        UpcomingTimeView(liveSchedule: video.startScheduled)
                        if video.isMengen {
                            Spacer()
                            Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    case .past:
                        PastTimeView(endedAt: video.endedAt)
                        if video.isMengen {
                            Spacer()
                            Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}

struct VideoCellView_Previews: PreviewProvider {
    static var previews: some View {
        VideoCellView(video: LiveVideo.previewLive, videoType: .live)
    }
}
