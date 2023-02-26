//
//  BlockMemberOnlyView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct BlockMemberOnlyView: View {
    var body: some View {
        BlockVideoInfoView(iconName: "person.fill", primaryText: {
            Text("BLOCK_MEMBER_ONLY_MEMBER")
        }, secondaryText: {
            Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
        })
    }
}

struct BlockMemberOnlyView_Previews: PreviewProvider {
    static var previews: some View {
        BlockMemberOnlyView()
        BlockMemberOnlyView()
            .environment(\.locale, .init(identifier: "ja"))
    }
}
