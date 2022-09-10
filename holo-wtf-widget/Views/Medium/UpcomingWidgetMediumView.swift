//
//  UpcomingWidgetMediumView.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-09-02.
//

import SwiftUI
import WidgetKit

struct UpcomingWidgetMediumView: View {
    let video: LiveVideo
    let videoThumbnail: Data
    
    var body: some View {
        HStack {
            if let image = UIImage(data: videoThumbnail) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(video.escapedTitle)
                    .lineLimit(3)
                    .font(.footnote)
                
                Text(video.channel.getTalentName())
                    .foregroundColor(.secondary)
                    .font(.caption2)
                
                if let schedule = video.startScheduled {
                    if let futureTimeString = getTimeIntervalStringFromReferenceDate(reference: schedule) {
                        Text(futureTimeString)
                            .foregroundColor(.secondary)
                            .font(.caption2)
                    }
                } else {
                    Text("UPCOMING_CELL_VIEW_STARTING_TIME_UNKNOWN")
                        .foregroundColor(.secondary)
                        .font(.caption2)
                }
            }
        }
    }
}

struct UpcomingWidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingWidgetMediumView(video: LiveVideo.previewLive, videoThumbnail: Data())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
