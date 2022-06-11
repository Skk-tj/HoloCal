//
//  SmallLiveWidgetView.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-06-08.
//

import SwiftUI
import WidgetKit

struct SmallLiveWidgetView: View {
    let live: LiveVideo
    let avatarData: Data
    
    var body: some View {
        let lang: NameLanguage = Locale.current.languageCode == "ja" ? .ja : .en
        
        VStack(alignment: .leading) {
            HStack {
                Text("LIVE_WIDGET_TITLE")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            
            if let avatarImage = UIImage(data: avatarData) {
                Image(uiImage: avatarImage)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                    .shadow(radius: 3)
            }
            
            Spacer()
            
            Text(live.channel.talent.names[lang]!)
                .lineLimit(1)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(live.escapedTitle)
                .lineLimit(3)
                .font(.caption)
        }
        .padding()
    }
}

struct SmallLiveWidgetView_Previews: PreviewProvider {
    static let testChannel = Channel(id: "UCp6993wxpyDPHUpavwDFqgg", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        SmallLiveWidgetView(live: previewLive, avatarData: Data())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
