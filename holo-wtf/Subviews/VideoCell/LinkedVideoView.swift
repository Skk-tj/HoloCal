//
//  LinkedVideoView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-25.
//

import SwiftUI

struct LinkedVideoView<Content: View>: View {
    var url: URL?
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        if let finalURL = url {
            Link(destination: finalURL) {
                content()
            }
        } else {
            content()
        }
    }
}

struct LinkedVideoView_Previews: PreviewProvider {
    static var previews: some View {
        LinkedVideoView(url: LiveVideo.previewLive.url) {
            LiveCellView(live: LiveVideo.previewLive)
        }
    }
}
