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
                Text(platform.localized)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            Text("BLOCK_PLATFORM_VIEW_PLATFORM")
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
