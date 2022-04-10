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
    
    var body: some View {
        VStack {
            LiveAvatarView(url: upcoming.channel.photo, avatarRadius: 128.0)
                .offset(x: 0, y: -35)
                .padding(.bottom, -35)
            
            VStack(alignment: .leading) {
                Text(upcoming.title.removingHTMLEntities())
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text(upcoming.channel.name)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                Divider()
                HStack {
                    UpcomingTimeView(liveSchedule: upcoming.liveSchedule)
                }
            }
        }
        .padding()
        .background(.bar, in: RoundedRectangle(cornerRadius: 20))
    }
}

struct UpcomingPaneView_Previews: PreviewProvider {
    static let testChannel = Channel(id: 0, ytChannelId: "testChannelId", name: "a certain tuber's channel name", description: "hihihi", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), publishedAt: Date(timeIntervalSinceNow: 10000), twitterLink: "a_certain_vtuber")
    
    static let previewLive = LiveVideo(id: 0, ytVideoKey: "testVideoId", title: "my debut live", thumbnail: nil, liveSchedule: nil, liveStart: nil, liveEnd: nil, liveViewers: 100, channel: testChannel)
    
    static var previews: some View {
        UpcomingPaneView(upcoming: previewLive)
    }
}
