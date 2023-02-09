//
//  BlockFormatView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct BlockFormatView: View {
    let format: LiveFormat
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "music.mic")
                Text(format.localized)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            Text("BLOCK_FORMAT_VIEW_FORMAT")
                .font(.callout)
                .foregroundColor(.secondary)
        }
    }
}

struct BlockFormatView_Previews: PreviewProvider {
    static var previews: some View {
        BlockFormatView(format: .irl)
        BlockFormatView(format: .online)
        BlockFormatView(format: .both)
    }
}
