//
//  LiveCellView.swift
//  holo-wtf
//
//
//

import SwiftUI
import MarqueeText
import HTMLString

struct LiveCellView: View {
    let live: LiveVideo
    
    var body: some View {
        HStack {
            LiveAvatarView(url: live.channel.photo)
            VStack(alignment: .leading) {
                MarqueeText(text: live.title.removingHTMLEntities(), font: UIFont.preferredFont(forTextStyle: .headline), leftFade: 14, rightFade: 16, startDelay: 3.0)
                Text(live.channel.name)
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
                Divider()
                HStack {
                    if isLiveMengen(title: live.title) {
                        Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    } else {
                        Text("LIVE_CELL_VIEW_PEOPLE_WATCHING \(live.liveViewers ?? 0)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    if let liveStart = live.liveStart {
                        if let elapsedTimeString = getTimeIntervalStringFromReferenceDate(reference: liveStart) {
                            Text("LIVE_CELL_VIEW_STARTED_AGO \(elapsedTimeString)")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    } else {
                        Text("LIVE_CELL_VIEW_WAITING")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

struct LiveCellView_Previews: PreviewProvider {
    static let testChannel = Channel(id: 0, ytChannelId: "testChannelId", name: "a certain tuber's channel name", description: "hihihi", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), publishedAt: Date(timeIntervalSinceNow: -1000), twitterLink: "a_certain_vtuber")
    
    static let previewLive = LiveVideo(id: 0, ytVideoKey: "testVideoId", title: "my debut live", thumbnail: nil, liveSchedule: nil, liveStart: nil, liveEnd: nil, liveViewers: 100, channel: testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: 0, ytVideoKey: "testVideoId", title: "my debut live member only", thumbnail: nil, liveSchedule: nil, liveStart: nil, liveEnd: nil, liveViewers: 100, channel: testChannel)
    
    static var previews: some View {
        LiveCellView(live: previewLive)
        LiveCellView(live: previewLiveMemberOnly)
    }
}
