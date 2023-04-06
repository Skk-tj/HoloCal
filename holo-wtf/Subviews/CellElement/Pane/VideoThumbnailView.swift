//
//  VideoThumbnailView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoThumbnailView: View {
    let video: LiveVideo
    
    var body: some View {
        AsyncImage(url: video.thumbnailURL!, content: { image in
            image
                .resizable()
                .aspectRatio(1.78, contentMode: .fit)
        }, placeholder: {
            ProgressView()
                .padding(.vertical)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1.78, contentMode: .fit)
        })
    }
}

struct VideoThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoThumbnailView(video: LiveVideo.previewLive)
    }
}
