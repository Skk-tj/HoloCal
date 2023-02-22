//
//  UpcomingWidgetView.swift
//  holo-wtf-widgetExtension
//
//
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
            } else {
                Image("WidgetPlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(upcoming.title)
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
                    
                    ChannelNameView(channel: upcoming.channel)
                }
                
                HStack {
                    BlockUpcomingTimeView(liveSchedule: upcoming.startScheduled)
                        .padding(.trailing)
                    if upcoming.isMengen {
                        BlockMemberOnlyView()
                            .padding(.trailing)
                    }
                    if upcoming.isPremiere {
                        BlockVideoTypeView()
                    }
                }
            }
        }
    }
}

struct UpcomingWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingWidgetView(upcoming: LiveVideo.previewLive, thumbnailData: Data(), avatarData: Data())
        #if os(iOS)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        #endif
    }
}
