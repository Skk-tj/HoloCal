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
                Text(live.title)
                    .font(.headline)
                    .lineLimit(2, reservesSpace: true)
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
                    
                    VStack(alignment: .leading) {
                        Text(live.channel.getTalentName())
                            .lineLimit(1)
                            .font(.subheadline)
                        Text(live.channel.getAltTalentName())
                            .lineLimit(1)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                HStack {
                    ViewerCounterView(viewer: live.liveViewers, memberOnly: live.isMengen)
                        .padding(.trailing)
                    
                    BlockLiveTimeView(liveTime: live.startActual)
                }
            }
        }
    }
}

struct LiveWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LiveWidgetView(live: LiveVideo.previewLive, thumbnailData: Data(), avatarData: Data())
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
        #if os(iOS)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        #endif
    }
}
