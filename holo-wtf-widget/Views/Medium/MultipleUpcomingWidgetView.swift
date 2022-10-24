//
//  MultipleUpcomingWidgetView.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-09-02.
//

import SwiftUI
import WidgetKit

struct MultipleUpcomingWidgetView: View {
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
                    
                    if let schedule = leftVideo.startScheduled {
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
                    
                    if let schedule = rightVideo.startScheduled {
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
}

struct MultipleUpcomingWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleLiveWidgetView(leftVideo: HololiveLiveVideo.previewLive, leftVideoThumbnail: Data(), rightVideo: HololiveLiveVideo.previewLiveMemberOnly, rightVideoThumbnail: Data())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
