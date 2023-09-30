//
//  AccessoryCircularView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryCircularView: View {
    let video: LiveVideo
    let avatarData: Data
    
    var body: some View {
        if let image = UIImage(data: avatarData) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .widgetLabel(video.channel.getTalentName())
                .clipShape(Circle())
                .widgetAccentable()
        } else {
            Text("N/A")
        }
    }
}

struct LiveAccessoryCircularView_Previews: PreviewProvider {
    static var previews: some View {
        AccessoryCircularView(video: LiveVideo.previewLive, avatarData: (try? Data(contentsOf: LiveVideo.previewLive.channel.photo!)) ?? Data())
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}
