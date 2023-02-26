//
//  BlockVideoTypeView.swift
//  holo-wtf
//
//
//

import SwiftUI

/// Shows whether this video is a premiere or not. 
struct BlockVideoTypeView: View {
    var body: some View {
        BlockVideoInfoView(iconName: "play.rectangle.fill", primaryText: {
            Text("BLOCK_VIDEO_TYPE_PREMIERE")
        }, secondaryText: {
            Text("BLOCK_VIDEO_TYPE_VIDEO")
        })
    }
}

struct BlockVideoTypeView_Previews: PreviewProvider {
    static var previews: some View {
        BlockVideoTypeView()
    }
}
