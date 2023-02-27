//
//  PastWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct PastWidgetView: View {
    let past: LiveVideo
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
                Text(past.title)
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
                    
                    ChannelNameView(channel: past.channel)
                }
                
                HStack {
                    BlockPastTimeView(endedAt: past.endedAt)
                        .padding(.trailing)
                    if past.isMengen {
                        BlockMemberOnlyView()
                            .padding(.trailing)
                    }
                }
            }
        }
    }
}

struct PastWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        PastWidgetView(past: LiveVideo.previewLive, thumbnailData: Data(), avatarData: Data())
    }
}
