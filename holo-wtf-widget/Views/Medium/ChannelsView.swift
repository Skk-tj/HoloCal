//
//  ChannelsView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct ChannelsView: View {
    let channels: [Channel]
    let thumbnails: [Data]
    
    var body: some View {
        let firstFour = thumbnails.prefix(4)
        
        HStack {
            ForEach(firstFour, id: \.self) { avatarData in
                if let avatarImage = UIImage(data: avatarData) {
                    Image(uiImage: avatarImage)
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 1)
                        }
                        .shadow(radius: 1)
                        .scaledToFit()
                } else {
                    Image(systemName: "person")
                        .aspectRatio(1, contentMode: .fill)
                        .background(.ultraThickMaterial)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 1)
                        }
                        .shadow(radius: 1)
                        .scaledToFit()
                }
            }
        }
        
    }
}

struct LiveChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsView(channels: [Channel.testChannel, Channel.testChannel2], thumbnails: [Data(), Data()])
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
