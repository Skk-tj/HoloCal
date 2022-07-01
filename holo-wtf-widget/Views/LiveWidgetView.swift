//
//  LiveWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct LiveWidgetView: View {
    let live: LiveVideo
    let thumbnailData: Data
    let avatarData: Data
    
    var body: some View {
        VStack {
            HStack {
                Text("LIVE_WIDGET_TITLE")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            
            if let image = UIImage(data: thumbnailData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(.leading)
                    .padding(.trailing)
            }
            
            VStack(alignment: .leading) {
                Text(live.title.removingHTMLEntities())
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
                            .padding(2)
                    }
                    
                    Text(live.channel.name)
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                HStack {
                    if live.isMengen {
                        Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("LIVE_CELL_VIEW_PEOPLE_WATCHING \(live.liveViewers)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    LiveTimeView(liveTime: live.startActual)
                        .multilineTextAlignment(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

struct LiveWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LiveWidgetView(live: LiveVideo.previewLive, thumbnailData: Data(), avatarData: Data())
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
