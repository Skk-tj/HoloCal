//
//  LiveCellView.swift
//  holo-wtf
//
//
//

import SwiftUI
import MarqueeText

struct LiveCellView: View {
    let live: LiveVideo
    
    var body: some View {
        HStack {
            LiveAvatarView(url: live.channel.photo)
            VStack(alignment: .leading) {
                MarqueeText(text: live.title, font: UIFont.preferredFont(forTextStyle: .headline), leftFade: 14, rightFade: 16, startDelay: 3.0)
                Text(live.channel.name)
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
                Divider()
                HStack {
                    if isLiveMengen(title: live.title) {
                        Text("Member-only Stream")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    } else {
                        Text("\(live.liveViewers ?? 0) watching")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    if let liveStart = live.liveStart {
                        if let elapsedTimeString = getTimeIntervalStringFromReferenceDate(reference: liveStart) {
                            Text("Started \(elapsedTimeString) ago")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    } else {
                        Text("Waiting...")
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
    
    static var previews: some View {
        LiveCellView(live: previewLive)
    }
}
