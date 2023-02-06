//
//  BlockPlatformView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct BlockPlatformView: View {
    let platform: Platform
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "mappin.circle")
                switch platform {
                case .niconico:
                    Text("Niconico")
                        .font(.title3)
                        .fontWeight(.bold)
                case .spwn:
                    Text("SPWN")
                        .font(.title3)
                        .fontWeight(.bold)
                case .tba:
                    Text("TBA")
                        .font(.title3)
                        .fontWeight(.bold)
                case .youtube:
                    Text("YouTube")
                        .font(.title3)
                        .fontWeight(.bold)
                case .zan:
                    Text("Za-N")
                        .font(.title3)
                        .fontWeight(.bold)
                case .zaiko:
                    Text("Zaiko")
                        .font(.title3)
                        .fontWeight(.bold)
                case .other:
                    Text("Other")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            Text("Platform")
                .font(.callout)
                .foregroundColor(.secondary)
        }
    }
}

struct BlockPlatformView_Previews: PreviewProvider {
    static var previews: some View {
        BlockPlatformView(platform: .niconico)
        BlockPlatformView(platform: .youtube)
    }
}
