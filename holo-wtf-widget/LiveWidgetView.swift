//
//  LiveWidgetView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-14.
//

import SwiftUI
import WidgetKit

struct LiveWidgetView: View {
    let live: LiveVideo
    let thumbnailData: Data
    let avatarData: Data
    
    var body: some View {
        VStack {
            HStack {
                Text("LIVE_WIDGET_TITLE")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            
            if let image = UIImage(data: thumbnailData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding(.leading)
                    .padding(.trailing)
            }
            
            VStack(alignment: .leading) {
                Text(live.title.removingHTMLEntities())
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    if let avatarImage = UIImage(data: avatarData) {
                        Image(uiImage: avatarImage)
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 2)
                            }
                            .shadow(radius: 4)
                            .padding(4.0)
                    }
                    
                    Text(live.channel.name)
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                HStack {
                    if live.isMengen {
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
            .padding(.bottom)
        }
    }
}

struct LiveWidgetView_Previews: PreviewProvider {
    static let testChannel = Channel(id: "abcd", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: "abcd", title: "my debut live member only", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        LiveWidgetView(live: previewLive, thumbnailData: Data(), avatarData: Data())
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
