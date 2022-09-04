//
//  UpcomingWidgetView.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-09-02.
//

import SwiftUI
import WidgetKit

struct UpcomingWidgetView: View {
    let upcoming: LiveVideo
    let thumbnailData: Data
    let avatarData: Data
    
    var body: some View {
        VStack {
            if let image = UIImage(data: thumbnailData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(upcoming.escapedTitle)
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    if let avatarImage = UIImage(data: avatarData) {
                        Image(uiImage: avatarImage)
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 1)
                            }
                            .shadow(radius: 1)
                    }
                    
                    Text(upcoming.channel.name)
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                HStack {
                    UpcomingTimeView(liveSchedule: upcoming.startScheduled)
                    
                    if upcoming.isMengen {
                        Spacer()
                        Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

struct UpcomingWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingWidgetView(upcoming: LiveVideo.previewLive, thumbnailData: Data(), avatarData: Data())
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
