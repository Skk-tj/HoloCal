//
//  LinkedVideoView.swift
//  holo-wtf
//
//
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
        Group {
            LinkedVideoView(url: LiveVideo.previewLive.url) {
                LiveCellView(live: LiveVideo.previewLive)
            }
            
            LinkedVideoView(url: LiveVideo.previewLive.url) {
                LivePaneView(live: LiveVideo.previewLive)
            }
        }
    }
}
