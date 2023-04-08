//
//  MainPhotoView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct MainPhotoView: View {
    let imageURL: URL?
    
    var body: some View {
        if let imageURL {
            AsyncImage(url: imageURL, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(1.78, contentMode: .fit)
                    .background(Color.secondary)
            })
        } else {
            Image(systemName: "exclamationmark.circle")
                .font(.system(size: 50))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1.78, contentMode: .fit)
                .background(Color.secondary)
        }
    }
}

struct MainPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        MainPhotoView(imageURL: URL(string: "https://teamup.com/12875225/attachment/01GT03M3BVXP8CKDW4WG4JFA95/preview/image.png?hash=f6d279ad8e76ba7aa793a95afc3acf90c8e4ea6fe509733d8e82c87ed8164034"))
    }
}
