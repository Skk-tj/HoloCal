//
//  VideoTitleView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoTitleView: View {
    let title: String
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            Text(title)
                .font(.headline)
                .lineLimit(2, reservesSpace: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
        } else {
            Text(title)
                .font(.headline)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct VideoTitleView_Previews: PreviewProvider {
    static var previews: some View {
        VideoTitleView(title: "This is a test")
    }
}
