//
//  MultipleLiveWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct MultipleLiveWidgetView: View {
    let leftVideo: LiveVideo
    let leftVideoThumbnail: Data
    
    let rightVideo: LiveVideo?
    let rightVideoThumbnail: Data
    
    var body: some View {
        let lang: NameLanguage = Locale.current.languageCode == "ja" ? .ja : .en
        
        VStack {
//            HStack {
//                Text("LIVE_WIDGET_TITLE")
//                    .font(.footnote)
//                    .foregroundColor(.secondary)
//
//                Spacer()
//            }
//            .padding(.leading)
            
            if let rightVideo = rightVideo {
                HStack {
                    // Left stream
                    VStack(alignment: .leading) {
                        if let image = UIImage(data: leftVideoThumbnail) {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                        }
                        
                        Text(leftVideo.escapedTitle)
                            .lineLimit(2)
                            .font(.caption)
                        
                        HStack {
                            Text(leftVideo.channel.talent.names[lang]!)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                                .font(.caption2)
                            
                            Text("\(Image(systemName: "eye")) \(leftVideo.liveViewers)")
                                .foregroundColor(.secondary)
                                .font(.caption2)
                        }
                    }
                    .padding(.leading)
                    
                    // Right stream
                    VStack(alignment: .leading) {
                        if let image = UIImage(data: rightVideoThumbnail) {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                        }
                        
                        Text(rightVideo.escapedTitle)
                            .lineLimit(2)
                            .font(.caption)
                        
                        HStack {
                            Text(rightVideo.channel.talent.names[lang]!)
                                .lineLimit(1)
                                .foregroundColor(.secondary)
                                .font(.caption2)
                            
                            Text("\(Image(systemName: "eye")) \(rightVideo.liveViewers)")
                                .foregroundColor(.secondary)
                                .font(.caption2)
                        }
                        
                    }
                    .padding(.trailing)
                }
            } else {
                HStack {
                    if let image = UIImage(data: leftVideoThumbnail) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(leftVideo.escapedTitle)
                            .lineLimit(2)
                            .font(.caption)
                        
                        Text(leftVideo.channel.talent.names[lang]!)
                            .foregroundColor(.secondary)
                            .font(.caption2)
                        
                        Text("\(Image(systemName: "eye")) \(leftVideo.liveViewers)")
                            .foregroundColor(.secondary)
                            .font(.caption2)
                        
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct MultipleLiveWidgetView_Previews: PreviewProvider {
    static let testChannel = Channel(id: "UCp6993wxpyDPHUpavwDFqgg", name: "test vtuber", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"), org: "Hololive", twitter: "aaaa")
    
    static let previewLive = LiveVideo(id: "abcd", title: "my debut live", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static let previewLiveMemberOnly = LiveVideo(id: "abcd", title: "my debut live member only", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, channel: testChannel)
    
    static var previews: some View {
        MultipleLiveWidgetView(leftVideo: previewLive, leftVideoThumbnail: Data(), rightVideo: previewLiveMemberOnly, rightVideoThumbnail: Data())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
