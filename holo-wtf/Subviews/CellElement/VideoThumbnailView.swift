//
//  VideoThumbnailView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-14.
//

import SwiftUI

struct VideoThumbnailView: View {
    let ytVideoKey: String?
    
    var body: some View {
        if let ytVideoKey = ytVideoKey {
            AsyncImage(url: URL(string: "https://i.ytimg.com/vi/\(ytVideoKey)/maxresdefault.jpg"), content: { image in
                image
                    .resizable()
                    .aspectRatio(1.78, contentMode: .fit)
            }, placeholder: {
                ProgressView()
                    .padding(.vertical)
            })
        }
    }
}

struct VideoThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoThumbnailView(ytVideoKey: "oMdokg4G9uw")
    }
}
