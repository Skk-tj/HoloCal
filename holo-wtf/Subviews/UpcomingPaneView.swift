//
//  UpcomingPaneView.swift
//  holo-wtf
//
//
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
                    .font(.title)
                    .lineLimit(3)
                Text(upcoming.channel.name)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Divider()
                HStack {
                    if let liveSchedule = upcoming.liveSchedule {
                        if let futureTimeString = getTimeIntervalStringFromReferenceDate(reference: liveSchedule) {
                            Text("UPCOMING_CELL_VIEW_STARTING_IN \(futureTimeString)")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    } else {
                        Text("UNCOMING_CELL_VIEW_STARTING_TIME_UNKNOWN")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
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
