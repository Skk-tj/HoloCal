//
//  SmallPastWidgetView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct SmallPastWidgetView: View {
    let past: LiveVideo
    let avatarData: Data
    
    var body: some View {
        VStack(alignment: .leading) {
            SmallWidgetAvatarView(avatarData: avatarData)
            
            Text(past.title)
                .font(.caption)
                .lineLimit(2, reservesSpace: true)
                .fixedSize(horizontal: false, vertical: true)
            Text(past.channel.getTalentName())
                .lineLimit(1)
                .font(.caption)
                .foregroundColor(.secondary)
            
            PastTimeView(endedAt: past.endedAt)
        }
    }
}

struct SmallPastWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallPastWidgetView(past: LiveVideo.previewLive, avatarData: Data())
    }
}
