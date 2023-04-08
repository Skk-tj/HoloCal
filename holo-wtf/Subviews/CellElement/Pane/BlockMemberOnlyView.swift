//
//  BlockMemberOnlyView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct BlockMemberOnlyView: View {
    var body: some View {
        BlockVideoInfoView(iconName: "person.fill.checkmark", primaryText: {
            Text("BLOCK_MEMBER_ONLY_MEMBER")
        }, secondaryText: {
            Text("BLOCK_MEMBER_ONLY_MEMBERSHIP")
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
