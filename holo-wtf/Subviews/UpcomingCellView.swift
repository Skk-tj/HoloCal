//
//  UpcomingCellView.swift
//  holo-wtf
//
//
//

import SwiftUI
import MarqueeText
import HTMLString

struct UpcomingCellView: View {
    var upcoming: LiveVideo
    
    var body: some View {
        HStack {
            LiveAvatarView(url: upcoming.channel.photo)
            VStack(alignment: .leading) {
                MarqueeText(text: upcoming.title.removingHTMLEntities(), font: UIFont.preferredFont(forTextStyle: .headline), leftFade: 16, rightFade: 16, startDelay: 3.0)
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
            }
        }
    }
}

struct UpcomingCellView_Previews: PreviewProvider {
    static let testChannel = Channel(id: 0, ytChannelId: "testChannelId", name: "a certain tuber's channel name", description: "hihihi", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), publishedAt: Date(timeIntervalSinceNow: 10000), twitterLink: "a_certain_vtuber")
    
    static let previewLive = LiveVideo(id: 0, ytVideoKey: "testVideoId", title: "my debut live", thumbnail: nil, liveSchedule: nil, liveStart: nil, liveEnd: nil, liveViewers: 100, channel: testChannel)
    
    static var previews: some View {
        UpcomingCellView(upcoming: previewLive)
    }
}
