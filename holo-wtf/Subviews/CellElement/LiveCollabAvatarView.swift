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
            if mentions.count > 5 {
                ForEach(0..<5, id: \.self) {
                    LiveAvatarView(url: mentions[$0].photo, avatarRadius: avatarRadius)
                        .offset(x: -CGFloat(CGFloat($0) * (CGFloat(avatarRadius) / 2.0)), y: 0)
                }
            } else {
                ForEach(0..<mentions.count, id: \.self) {
                    LiveAvatarView(url: mentions[$0].photo, avatarRadius: avatarRadius)
                        .offset(x: -CGFloat(CGFloat($0) * (CGFloat(avatarRadius) / 2.0)), y: 0)
                }
            }
        }
        .padding(.trailing, -Double(mentions.count > 5 ? 4 : mentions.count-1) * (avatarRadius / 2))
        
//        ViewThatFits {
//            HStack {
//                ForEach(0..<mentions.count, id: \.self) {
//                    LiveAvatarView(url: mentions[$0].photo, avatarRadius: avatarRadius)
//                        .offset(x: -CGFloat(CGFloat($0) * (CGFloat(avatarRadius) / 2.0)), y: 0)
//                }
//            }
//            .padding(.trailing, -Double(mentions.count-1) * (avatarRadius / 2))
//
//            if mentions.count > 5 {
//                HStack {
//                    ForEach(0..<5, id: \.self) {
//                        LiveAvatarView(url: mentions[$0].photo, avatarRadius: avatarRadius)
//                            .offset(x: -CGFloat(CGFloat($0) * (CGFloat(avatarRadius) / 2.0)), y: 0)
//                    }
//                }
//                .padding(.trailing, -Double(4) * (avatarRadius / 2))
//            } else if mentions.count == 4 {
//                HStack {
//                    ForEach(0..<4, id: \.self) {
//                        LiveAvatarView(url: mentions[$0].photo, avatarRadius: avatarRadius)
//                            .offset(x: -CGFloat(CGFloat($0) * (CGFloat(avatarRadius) / 2.0)), y: 0)
//                    }
//                }
//                .padding(.trailing, -Double(3) * (avatarRadius / 2))
//            } else if mentions.count == 3 {
//                HStack {
//                    ForEach(0..<3, id: \.self) {
//                        LiveAvatarView(url: mentions[$0].photo, avatarRadius: avatarRadius)
//                            .offset(x: -CGFloat(CGFloat($0) * (CGFloat(avatarRadius) / 2.0)), y: 0)
//                    }
//                }
//                .padding(.trailing, -Double(2) * (avatarRadius / 2))
//            } else if mentions.count == 2 {
//                HStack {
//                    ForEach(0..<2, id: \.self) {
//                        LiveAvatarView(url: mentions[$0].photo, avatarRadius: avatarRadius)
//                            .offset(x: -CGFloat(CGFloat($0) * (CGFloat(avatarRadius) / 2.0)), y: 0)
//                    }
//                }
//                .padding(.trailing, -Double(1) * (avatarRadius / 2))
//            } else if mentions.count == 1 {
//                HStack {
//                    ForEach(0..<1, id: \.self) {
//                        LiveAvatarView(url: mentions[$0].photo, avatarRadius: avatarRadius)
//                            .offset(x: -CGFloat(CGFloat($0) * (CGFloat(avatarRadius) / 2.0)), y: 0)
//                    }
//                }
//                .padding(.trailing, -Double(0) * (avatarRadius / 2))
//            } else {
//                EmptyView()
//            }
//        }
    }
}

struct LiveCollabAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LiveCollabAvatarView(mentions: [Channel.testChannel, Channel.testChannel2, Channel.testChannel, Channel.testChannel])
            LiveCollabAvatarView(mentions: [Channel.testChannel, Channel.testChannel2])
        }
    }
}
