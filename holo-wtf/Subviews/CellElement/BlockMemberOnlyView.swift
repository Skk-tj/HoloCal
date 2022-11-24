//
//  BlockMemberOnlyView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-24.
//

import SwiftUI

struct BlockMemberOnlyView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.fill")
                Text("BLOCK_MEMBER_ONLY_MEMBER")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                .font(.callout)
                .foregroundColor(.secondary)
        }
    }
}

struct BlockMemberOnlyView_Previews: PreviewProvider {
    static var previews: some View {
        BlockMemberOnlyView()
        BlockMemberOnlyView()
            .environment(\.locale, .init(identifier: "ja"))
    }
}
