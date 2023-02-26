//
//  LiveWidgetMediumView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct LiveWidgetMediumView: View {
    let video: LiveVideo
    let videoThumbnail: Data
    
    var body: some View {
        HStack {
            if let image = UIImage(data: videoThumbnail) {
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
            
            VStack(alignment: .leading) {
                Text(video.title)
                    .lineLimit(3)
                    .font(.footnote)
                
                Text(video.channel.getTalentName())
                    .foregroundColor(.secondary)
                    .font(.caption2)
                
                Text("\(Image(systemName: "eye")) \(video.liveViewers ?? 0)")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                
            }
        }
    }
}

struct LiveWidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        LiveWidgetMediumView(video: LiveVideo.previewLive, videoThumbnail: Data())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
