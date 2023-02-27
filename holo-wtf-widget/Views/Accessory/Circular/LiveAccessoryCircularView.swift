//
//  LiveAccessoryCircularView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct LiveAccessoryCircularView: View {
    let live: LiveVideo
    let avatarData: Data
    
    var body: some View {
        if let image = UIImage(data: avatarData) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .widgetLabel(live.channel.getTalentName())
        } else {
            Text("N/A")
        }
    }
}

struct LiveAccessoryCircularView_Previews: PreviewProvider {
    static var previews: some View {
        LiveAccessoryCircularView(live: LiveVideo.previewLive, avatarData: try! Data(contentsOf: LiveVideo.previewLive.channel.photo!))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}
