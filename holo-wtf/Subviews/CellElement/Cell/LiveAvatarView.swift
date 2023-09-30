//
//  LiveAvatarView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveAvatarView: View {
    let url: URL?
    var avatarRadius: Double = 64.0
    var needOutline: Bool = true
    
    var body: some View {
        AsyncImage(url: url, content: { image in
            image
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: avatarRadius, height: avatarRadius)
                .clipShape(Circle())
                .overlay {
                    if needOutline {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                }
                .shadow(radius: 1)
        }, placeholder: {
            ProgressView()
                .frame(width: avatarRadius, height: avatarRadius)
                .overlay {
                    if needOutline {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                }
                .shadow(radius: 1)
        })
    }
}

struct LiveAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        LiveAvatarView(url: URL(string: "https://yt3.ggpht.com/ytc/AKedOLQH3CqU4dL9EWjrYl6aKn26_DAAHbCXEBVyMTaWZA=s800-c-k-c0x00ffffff-no-rj"))
    }
}
