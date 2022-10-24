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
            LinkedVideoView(url: HololiveLiveVideo.previewLive.url) {
                LiveCellView(live: HololiveLiveVideo.previewLive)
            }
            
            LinkedVideoView(url: HololiveLiveVideo.previewLive.url) {
                LivePaneView(live: HololiveLiveVideo.previewLive)
            }
        }
    }
}
