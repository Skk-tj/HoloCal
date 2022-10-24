//
//  SmallLiveWidgetView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct SmallLiveWidgetView: View {
    let live: any LiveVideo
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
            }
            
            Text(live.title)
                .font(.caption)
                .lineLimit(2)
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

struct SmallLiveWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallLiveWidgetView(live: HololiveLiveVideo.previewLive, avatarData: Data())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
