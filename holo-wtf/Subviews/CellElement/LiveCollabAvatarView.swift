//
//  LiveCollabAvatarView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveCollabAvatarView: View {
    let mentions: [Channel]
    var avatarRadius: Double = 64.0
    
    var body: some View {
        HStack {
            ForEach(0..<mentions.count, id: \.self) {
                LiveAvatarView(url: mentions[$0].photo, avatarRadius: avatarRadius)
                    .offset(x: -CGFloat(CGFloat($0) * (CGFloat(avatarRadius) / 2.0)), y: 0)
            }
        }
        .padding(.trailing, -Double(mentions.count - 1) * (avatarRadius / 2))
    }
}

struct LiveCollabAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        LiveCollabAvatarView(mentions: [Channel.testChannel, Channel.testChannel2])
    }
}
