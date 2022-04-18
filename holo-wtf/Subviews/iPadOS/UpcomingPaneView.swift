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
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        VStack {
            VideoThumbnailView(ytVideoKey: upcoming.id)
            
            VStack(alignment: .leading) {
                Text(upcoming.title.removingHTMLEntities())
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                TopicTagView(topicId: upcoming.topicId)
                
                HStack {
                    LiveAvatarView(url: upcoming.channel.photo, avatarRadius: 40.0)
                    
                    Text(upcoming.channel.name)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    if favourited.contains(where: {$0 == upcoming.channel.id}) {
                        Image(systemName: "star.fill")
                            .tint(.yellow)
                    }
                }
                Divider()
                HStack {
                    UpcomingTimeView(liveSchedule: upcoming.startScheduled)
                    if isLiveMengen(live: upcoming) {
                        Spacer()
                        Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 20))
        .cornerRadius(20)
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
