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
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VideoThumbnailView(ytVideoKey: upcoming.id)
                
                VStack(alignment: .leading) {
                    Text(upcoming.title.removingHTMLEntities())
                        .font(.headline)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        LiveAvatarView(url: upcoming.channel.photo, avatarRadius: 40.0)
                        
                        Text(upcoming.channel.name)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
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
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: "abcd", title: "my debut live member only", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        UpcomingPaneView(upcoming: previewLive)
    }
}
