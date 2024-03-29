//
//  MultipleWidgetView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct SingleVideoMultipleWidgetView: View {
    let video: LiveVideo
    let videoThumbnail: Data
    let videoType: VideoType
    
    var body: some View {
        HStack {
            Spacer()
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
            Spacer()
        }
        
        Text(video.title)
            .lineLimit(1)
            .font(.caption)
        
        switch videoType {
        case .live:
            if video.isMengen {
                Text("\(video.channel.getTalentName()) \(Image(systemName: "person.fill.checkmark"))")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .lineLimit(1)
            } else {
                Text("\(video.channel.getTalentName()) \(Image(systemName: "eye")) \(video.liveViewers ?? 0)")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .lineLimit(1)
            }
        case .upcoming:
            Text("\(video.channel.getTalentName()) \(Image(systemName: "clock")) \(video.getUpcomingRelativeTimeString(shortMode: true))")
                .foregroundColor(.secondary)
                .font(.caption2)
                .lineLimit(1)
        case .past:
            Text("\(video.channel.getTalentName()) \(Image(systemName: "clock")) \(video.getPastRelativeTimeString(shortMode: true))")
                .foregroundColor(.secondary)
                .font(.caption2)
                .lineLimit(1)
        }
    }
}

struct MultipleWidgetView: View {
    let leftVideo: LiveVideo
    let leftVideoThumbnail: Data
    
    let rightVideo: LiveVideo
    let rightVideoThumbnail: Data
    
    let videoType: VideoType
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                SingleVideoMultipleWidgetView(video: leftVideo, videoThumbnail: leftVideoThumbnail, videoType: videoType)
            }
            
            VStack(alignment: .leading) {
                SingleVideoMultipleWidgetView(video: rightVideo, videoThumbnail: rightVideoThumbnail, videoType: videoType)
            }
        }
    }
}

struct MultipleWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleWidgetView(leftVideo: LiveVideo.previewLive, leftVideoThumbnail: Data(), rightVideo: LiveVideo.previewLiveMemberOnly, rightVideoThumbnail: Data(), videoType: .live)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
