//
//  WidgetMediumView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct WidgetMediumView: View {
    let video: LiveVideo
    let videoThumbnail: Data
    let videoType: VideoType
    
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
                
                switch videoType {
                case .live:
                    Text("\(Image(systemName: "eye")) \(video.liveViewers ?? 0)")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                case .upcoming:
                    Text("\(Image(systemName: "clock")) \(video.getUpcomingRelativeTimeString(shortMode: true))")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                case .past:
                    Text("\(Image(systemName: "clock")) \(video.getPastRelativeTimeString(shortMode: true))")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                }
            }
        }
    }
}

struct WidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetMediumView(video: LiveVideo.previewLive, videoThumbnail: Data(), videoType: .live)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
