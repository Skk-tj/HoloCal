//
//  MultipleLiveWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct MultipleLiveWidgetView: View {
    let leftVideo: any LiveVideo
    let leftVideoThumbnail: Data
    
    let rightVideo: any LiveVideo
    let rightVideoThumbnail: Data
    
    var body: some View {
        HStack {
            // Left stream
            VStack(alignment: .leading) {
                if let image = UIImage(data: leftVideoThumbnail) {
                    HStack {
                        Spacer()
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        Spacer()
                    }
                    
                }
                
                Text(leftVideo.title)
                    .lineLimit(1)
                    .font(.caption)
                
                HStack {
                    Text(leftVideo.channel.getTalentName())
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .font(.caption2)
                    
                    Text("\(Image(systemName: "eye")) \(leftVideo.liveViewers)")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                }
            }
            
            // Right stream
            VStack(alignment: .leading) {
                if let image = UIImage(data: rightVideoThumbnail) {
                    HStack {
                        Spacer()
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        Spacer()
                    }
                }
                
                Text(rightVideo.title)
                    .lineLimit(1)
                    .font(.caption)
                
                HStack {
                    Text(rightVideo.channel.getTalentName())
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                        .font(.caption2)
                    
                    Text("\(Image(systemName: "eye")) \(rightVideo.liveViewers)")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                }
                
            }
        }
    }
}

struct MultipleLiveWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleLiveWidgetView(leftVideo: HololiveLiveVideo.previewLive, leftVideoThumbnail: Data(), rightVideo: HololiveLiveVideo.previewLiveMemberOnly, rightVideoThumbnail: Data())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
