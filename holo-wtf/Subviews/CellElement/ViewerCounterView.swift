//
//  ViewerCounterView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ViewerCounterView: View {
    let viewer: Int
    let memberOnly: Bool
    
    var body: some View {
        BlockVideoInfoView(iconName: "person.fill", primaryText: {
            Text(memberOnly ? "VIEWER_COUNTER_VIEW_MEMBER_NA" : "\(viewer)")
        }, secondaryText: {
            Text(memberOnly ? "VIEWER_COUNTER_VIEW_MEMBER_ONLY" : "VIEWER_COUNTER_VIEW_WATCHING")
        })
    }
}

struct ViewerCounterView_Previews: PreviewProvider {
    static var previews: some View {
        ViewerCounterView(viewer: 12345, memberOnly: false)
        ViewerCounterView(viewer: 12345, memberOnly: true)
    }
}
