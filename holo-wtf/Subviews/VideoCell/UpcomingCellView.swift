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
    let twitterLink: String?
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        HStack {
            LiveAvatarView(url: upcoming.channel.photo)
            VStack(alignment: .leading) {
                MarqueeText(text: upcoming.title.removingHTMLEntities(), font: UIFont.preferredFont(forTextStyle: .headline), leftFade: 16, rightFade: 16, startDelay: 3.0)
                
                TopicTagView(topicId: upcoming.topicId)
                
                HStack {
                    Text(upcoming.channel.name)
                        .font(.subheadline)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                    
                    if favourited.contains(where: {$0 == upcoming.channel.id}) {
                        Image(systemName: "star.fill")
                            .tint(.yellow)
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
            }
        }
        .contextMenu {
            VideoContextMenu(video: upcoming, twitterLink: twitterLink)
        }
    }
}

struct UpcomingCellView_Previews: PreviewProvider {
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: "abcd", title: "my debut live member only", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        UpcomingCellView(upcoming: previewLive, twitterLink: "abcd")
    }
}