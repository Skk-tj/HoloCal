//
//  LivePaneView.swift
//  holo-wtf
//
//
//

import SwiftUI
import HTMLString

struct LivePaneView: View {
    let live: LiveVideo
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        VStack {
            VideoThumbnailView(ytVideoKey: live.id)
            
            VStack(alignment: .leading) {
                Text(live.title.removingHTMLEntities())
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                if let topicId = live.topicId {
                    Text(topicId)
                        .padding(6)
                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    LiveAvatarView(url: live.channel.photo, avatarRadius: 40.0)
                    
                    Text(live.channel.name)
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    if favourited.contains(where: {$0 == live.channel.id}) {
                        Image(systemName: "star.fill")
                            .tint(.yellow)
                    }
                }
                Divider()
                HStack {
                    if isLiveMengen(title: live.title) {
                        Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("LIVE_CELL_VIEW_PEOPLE_WATCHING \(live.liveViewers)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    LiveTimeView(liveTime: live.startActual)
                        .multilineTextAlignment(.trailing)
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 20))
        .cornerRadius(20)
    }
}

struct LivePaneView_Previews: PreviewProvider {
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: "abcd", title: "my debut live member only", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        LivePaneView(live: previewLive)
        LivePaneView(live: previewLive).preferredColorScheme(.dark)
    }
}
