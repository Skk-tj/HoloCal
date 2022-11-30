//
//  ChannelsView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct LiveChannelsView: View {
    let channels: [Channel]
    let thumbnails: [Data]
    
    var body: some View {
        let firstFour = thumbnails.prefix(4)
        
        HStack {
            Spacer()
            
            HStack {
                ForEach(firstFour, id: \.self) { avatarData in
                    if let avatarImage = UIImage(data: avatarData) {
                        Image(uiImage: avatarImage)
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 1)
                            }
                            .shadow(radius: 1)
                    } else {
                        Image(systemName: "person")
                            .aspectRatio(1, contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .background(.ultraThickMaterial)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 1)
                            }
                            .shadow(radius: 1)
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct LiveChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        LiveChannelsView(channels: [Channel.testChannel, Channel.testChannel2], thumbnails: [Data(), Data()])
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
