//
//  VideoContextMenu.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-25.
//

import SwiftUI

struct VideoContextMenu: View {
    let twitterLink: String?
    let ytChannelId: String?
    
    var body: some View {
        if let twitterLink = twitterLink {
            let url = "https://twitter.com/\(twitterLink)"
            
            if let finalURL = URL(string: url) {
                Link(destination: finalURL) {
                    Text("VIDEO_CONTEXT_MENU_TWITTER_PROFILE")
                }
            }
        }
        
        if let ytChannelId = ytChannelId {
            let url = "https://www.youtube.com/channel/\(ytChannelId)"
            
            if let finalURL = URL(string: url) {
                Link(destination: finalURL) {
                    Text("VIDEO_CONTENT_MENU_YOUTUBE_CHANNEL")
                }
            }
        }
    }
}

struct VideoContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        VideoContextMenu(twitterLink: "testTwitterLink", ytChannelId: "testYtId")
    }
}
