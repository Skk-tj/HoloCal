//
//  MultipleUpcomingWidgetView.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-09-02.
//

import SwiftUI
import WidgetKit

struct MultipleUpcomingWidgetView: View {
    let leftVideo: LiveVideo
    let leftVideoThumbnail: Data
    
    let rightVideo: LiveVideo
    let rightVideoThumbnail: Data
    
    var body: some View {
        let lang: NameLanguage = Locale.current.languageCode == "ja" ? .ja : .en
        
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
                
                Text(leftVideo.escapedTitle)
                    .lineLimit(1)
                    .font(.caption)
                
                HStack {
                    Text(leftVideo.channel.getTalentName(lang: lang))
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
                
                Text(rightVideo.escapedTitle)
                    .lineLimit(1)
                    .font(.caption)
                
                HStack {
                    Text(rightVideo.channel.getTalentName(lang: lang))
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
        MultipleLiveWidgetView(leftVideo: LiveVideo.previewLive, leftVideoThumbnail: Data(), rightVideo: LiveVideo.previewLiveMemberOnly, rightVideoThumbnail: Data())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
