//
//  VideoThumbnailView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoThumbnailView: View {
    let ytVideoKey: String?
    
    var body: some View {
        if let ytVideoKey = ytVideoKey {
            AsyncImage(url: URL(string: "https://i.ytimg.com/vi/\(ytVideoKey)/hq720.jpg"), content: { image in
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
}

struct VideoThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoThumbnailView(ytVideoKey: "oMdokg4G9uw")
    }
}
