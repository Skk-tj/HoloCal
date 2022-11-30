//
//  SmallLiveWidgetView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct SmallLiveWidgetView: View {
    let live: LiveVideo
    let avatarData: Data
    
    var body: some View {
        VStack(alignment: .leading) {
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
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                    .shadow(radius: 1)
            }
            
            Text(live.title)
                .font(.caption)
                .lineLimit(2, reservesSpace: true)
                .fixedSize(horizontal: false, vertical: true)
            Text(live.channel.getTalentName())
                .lineLimit(1)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text("\(Image(systemName: "eye")) \(live.liveViewers)")
                .foregroundColor(.secondary)
                .font(.caption2)
        }
    }
}

@available(iOS 16.0, *)
struct SmallLiveWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallLiveWidgetView(live: LiveVideo.previewLive, avatarData: Data())
        #if os(iOS)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        #endif
    }
}
