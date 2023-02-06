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
                switch format {
                case .irl:
                    Text("On-site")
                        .font(.title3)
                        .fontWeight(.bold)
                case .online:
                    Text("Online")
                        .font(.title3)
                        .fontWeight(.bold)
                case .both:
                    Text("On-site + Online")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            Text("Format")
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
