//
//  LivePaneView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-23.
//

import SwiftUI
import HTMLString

struct LivePaneView: View {
    let live: LiveVideo
    
    var body: some View {
        VStack {
            LiveAvatarView(url: live.channel.photo, avatarRadius: 128.0)
                .offset(x: 0, y: -35)
                .padding(.bottom, -35)
            
            VStack(alignment: .leading) {
                Text(live.title.removingHTMLEntities())
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text(live.channel.name)
                    .lineLimit(1)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Divider()
                HStack {
                    if isLiveMengen(title: live.title) {
                        Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("LIVE_CELL_VIEW_PEOPLE_WATCHING \(live.liveViewers ?? 0)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    LiveTimeView(liveTime: live.liveStart)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
        .padding()
        .background(.bar, in: RoundedRectangle(cornerRadius: 20))
    }
}

struct LivePaneView_Previews: PreviewProvider {
    static let testChannel = Channel(id: 0, ytChannelId: "testChannelId", name: "a certain tuber's channel name", description: "hihihi", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), publishedAt: Date(timeIntervalSinceNow: -1000), twitterLink: "a_certain_vtuber")
    
    static let previewLive = LiveVideo(id: 0, ytVideoKey: "testVideoId", title: "my debut live", thumbnail: nil, liveSchedule: nil, liveStart: nil, liveEnd: nil, liveViewers: 100, channel: testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: 0, ytVideoKey: "testVideoId", title: "my debut live member only", thumbnail: nil, liveSchedule: nil, liveStart: nil, liveEnd: nil, liveViewers: 100, channel: testChannel)
    
    static var previews: some View {
        LivePaneView(live: previewLive)
        LivePaneView(live: previewLive).preferredColorScheme(.dark)
    }
}
