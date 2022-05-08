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
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @State var liveIconOpcality: Double = 0
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VideoThumbnailView(ytVideoKey: live.id)
                
                VStack(alignment: .leading) {
                    Text(live.title.removingHTMLEntities())
                        .font(.headline)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        LiveAvatarView(url: live.channel.photo, avatarRadius: 40.0)
                        
                        Text(live.channel.name)
                            .lineLimit(1)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    HStack {
                        if isLiveMengen(live: live) {
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
                    .padding(.bottom)
                    
                    PaneViewButtonRowView(video: live)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    HStack(alignment: .top, spacing: 2) {
                        Image(systemName: "circle.fill")
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                    liveIconOpcality = 1
                                }
                            }
                            .opacity(liveIconOpcality)
                        Text("LIVE")
                    }
                        .padding(5)
                        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.top)
                        .padding(.leading)
                    TopicTagView(topicId: live.topicId)
                        .padding(.leading)
                }
                
                Spacer()
                
                if favourited.contains(where: {$0 == live.channel.id}) {
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

struct LivePaneView_Previews: PreviewProvider {
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: "abcd", title: "my debut live member only", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        LivePaneView(live: previewLive)
        LivePaneView(live: previewLive).preferredColorScheme(.dark)
    }
}
