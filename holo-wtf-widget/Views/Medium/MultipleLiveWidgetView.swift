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
    
    let rightVideo: LiveVideo
    let rightVideoThumbnail: Data
    
    var body: some View {
        HStack {
            // Left stream
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    if let image = UIImage(data: leftVideoThumbnail) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    } else {
                        Image("WidgetPlaceholder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                
                Text(leftVideo.title)
                    .lineLimit(1)
                    .font(.caption)
                
                HStack {
                    Text(leftVideo.channel.getTalentName())
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .font(.caption2)
                    
                    Text("\(Image(systemName: "eye")) \(leftVideo.liveViewers ?? 0)")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                }
            }
            
            // Right stream
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    if let image = UIImage(data: rightVideoThumbnail) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    } else {
                        Image("WidgetPlaceholder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                
                Text(rightVideo.title)
                    .lineLimit(1)
                    .font(.caption)
                
                HStack {
                    Text(rightVideo.channel.getTalentName())
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                        .font(.caption2)
                    
                    Text("\(Image(systemName: "eye")) \(rightVideo.liveViewers ?? 0)")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                }
                
            }
        }
    }
}

struct MultipleLiveWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleLiveWidgetView(leftVideo: LiveVideo.previewLive, leftVideoThumbnail: Data(), rightVideo: LiveVideo.previewLiveMemberOnly, rightVideoThumbnail: Data())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
