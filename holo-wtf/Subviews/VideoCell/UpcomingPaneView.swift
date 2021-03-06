//
//  UpcomingPaneView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-24.
//

import SwiftUI
import HTMLString

struct UpcomingPaneView: View {
    var upcoming: LiveVideo
    
    @Binding var isShowingCollabSheet: Bool
    @Binding var collabChannels: [Channel]
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VideoThumbnailView(ytVideoKey: upcoming.id)
                
                VStack(alignment: .leading) {
                    Text(upcoming.escapedTitle)
                        .font(.headline)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        LiveAvatarView(url: upcoming.channel.photo, avatarRadius: 40.0)
                        
                        if let mentions = upcoming.mentions {
                            Text("\(upcoming.channel.name) \(String(localized: "LIVE_PANE_VIEW_WITH"))")
                                .lineLimit(1)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            LiveCollabAvatarView(mentions: mentions, avatarRadius: 40.0)
                                .onTapGesture {
                                    isShowingCollabSheet = true
                                    collabChannels = mentions
                                }
                        } else {
                            Text(upcoming.channel.name)
                                .lineLimit(1)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    Divider()
                    HStack {
                        UpcomingTimeView(liveSchedule: upcoming.startScheduled)
                        if upcoming.isMengen {
                            Spacer()
                            Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.bottom)
                    
                    PaneViewButtonRowView(video: upcoming)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack {
                TopicTagView(topicId: upcoming.topicId)
                    .padding()
                
                Spacer()
                
                if favourited.contains(where: {$0 == upcoming.channel.id}) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow) // iOS needs it cause plain list style does not show tint
                        .tint(.yellow)
                        .padding()
                        .shadow(radius: 5)
                }
            }
        }
    }
}

struct UpcomingPaneView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingPaneView(upcoming: LiveVideo.previewLive, isShowingCollabSheet: Binding.constant(false), collabChannels: Binding.constant([Channel.testChannel]))
    }
}
